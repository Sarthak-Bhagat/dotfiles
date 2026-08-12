#!/bin/bash
# ─── CONFIGURE THESE BEFORE RUNNING ────────────────────────────────────────────
readonly USERNAME="a00046429" # Your username as provided by Keith, CASE SENSITIVE
readonly KEY_PATH="$HOME/.ssh/tud_key.$USERNAME" # Leave unchanged in most cases
readonly KERNEL_KILL_TIMER=30 # The amount of time you get to kill running kernels
# ────────────────────────────────────────────────────────────────────────────────

SSH_ERROR_LOG=$(mktemp "${TMPDIR:-/tmp}/ssh_error.XXXXXX")
SSH_PID=""

cleanup() {
    if [[ -n "$SSH_PID" ]]; then
        kill "$SSH_PID" 2>/dev/null
        wait "$SSH_PID" 2>/dev/null
    fi
    rm -f "$SSH_ERROR_LOG"
}
trap cleanup EXIT

clear_line() {
    if command -v tput &>/dev/null; then
        tput cr; tput el
    else
        printf "\r%-80s\r" ""
    fi
}

open_browser() {
    local url="$1"
    case "$OSTYPE" in
        darwin*)       open "$url" ;;
        linux-gnu*)    xdg-open "$url" ;;
        msys*|cygwin*) cmd.exe /c start "" "$url" ;;
        *)
            echo "Warning: Don't know how to open a browser on $OSTYPE."
            echo "Please navigate to: $url"
            ;;
    esac
}

# Check username is set
if [[ -z "$USERNAME" ]]; then
    echo "Error: USERNAME is not set. Edit the script and add your username."
    exit 1
fi

echo "Please confirm your connection details:"
echo ""
echo "  Username : $USERNAME"
echo "  Key path : $KEY_PATH"
echo ""

confirm=""
for ((i=5; i>0; i--)); do
    printf "\r  Press any key to continue, or Q to quit (auto-continues in %d)... " "$i"
    read -r -t 1 -s -n 1 confirm && break
done
clear_line
echo ""
if [[ "${confirm,,}" == "q" ]]; then
    echo "Exiting. Edit the script to update your username and key path."
    exit 1
fi

# Verify key file exists
if [[ ! -f "$KEY_PATH" ]]; then
    echo "Error: Key file not found at '$KEY_PATH'"
    echo "Update KEY_PATH in the script and try again."
    exit 1
fi

# Check if port 8000 is already in use
if (lsof -iTCP:8000 -sTCP:LISTEN -t || ss -tln | grep -q ':8000 ') 2>/dev/null; then
    echo "Warning: Port 8000 is already in use. The tunnel may not work correctly."
fi

# Start SSH tunnel in background
ssh -L 8000:10.10.2.101:8000 \
    -i "$KEY_PATH" \
    -N \
    -o ConnectTimeout=10 \
    -o BatchMode=yes \
    "${USERNAME}@193.1.127.10" \
    -p 2201 \
    2>"$SSH_ERROR_LOG" &
SSH_PID=$!
echo "SSH tunnel started (PID: $SSH_PID)"

# Give SSH time to connect and write any errors to the log
sleep 3

if ! kill -0 "$SSH_PID" 2>/dev/null; then
    error=$(cat "$SSH_ERROR_LOG")
    echo "SSH tunnel failed to start."
    case "${error,,}" in
        *"timed out"*|*"connection refused"*|*"no route to host"*|*"network is unreachable"*)
            echo "→ Connection timed out or refused. SSH may not be allowed on this network." ;;
        *"permission denied"*|*"publickey"*)
            echo "→ Permission denied. Check your key path and username." ;;
        *"could not resolve"*|*"name or service not known"*)
            echo "→ Could not resolve host. Check your internet connection." ;;
        *)
            echo "→ $error" ;;
    esac
    exit 1
fi

# Open browser
echo "Opening http://localhost:8000 ..."
open_browser "http://localhost:8000"

# Suppress Ctrl+C, force Q to quit
trap '' INT
echo ""
echo "Tunnel running. Press Q to close."
while true; do
    read -r -s -n 1 key
    if [[ "${key,,}" == "q" ]]; then
        echo ""
        echo "┌─────────────────────────────────────────────┐"
        echo "│  Opening your running kernels in browser... │"
        echo "│  Shut down any kernels you no longer need.  │"
        echo "└─────────────────────────────────────────────┘"
        echo ""
        open_browser "http://localhost:8000/user/$USERNAME/tree#running"

        # Drain any buffered input left over from Q press
        while read -r -t 0.1 -s -n 1 2>/dev/null; do :; done

        # Countdown in foreground, 1 second ticks
        for ((i=KERNEL_KILL_TIMER; i>0; i--)); do
            printf "\r  Tunnel closes in %02d:%02d — press any key to close now... " $((i/60)) $((i%60))
            read -r -t 1 -s -n 1 && break
        done
        clear_line

        if [[ -s "$SSH_ERROR_LOG" ]]; then
            echo "── SSH STDERR ─────────────────────────────"
            cat "$SSH_ERROR_LOG"
            echo "───────────────────────────────────────────"
        fi
        echo "Tunnel closed."
        break
    fi
done

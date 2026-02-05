#!/bin/bash

# Configuration
JACKETT_URL="http://localhost:9117"
JACKETT_API_KEY="khwbwbuchd29j7n2mrjy435usfjdhjky"
RADARR_URL="http://localhost:7878"
RADARR_API_KEY="877a49faaca54a9bb2f9867e99e2e134"


LOG_FILE="./jackett_to_radarr.log"

# -------------------------
# LOGGING FUNCTIONS
# -------------------------
log_info() {
    echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') $*" | tee -a "$LOG_FILE"
}

log_error() {
    echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') $*" | tee -a "$LOG_FILE" >&2
}

# -------------------------
# FETCH JACKETT INDEXERS
# -------------------------
log_info "Fetching Jackett indexers..."
jackett_json=$(curl -s "$JACKETT_URL/api/v2.0/indexers?apikey=$JACKETT_API_KEY")

if [[ -z "$jackett_json" ]]; then
    log_error "Failed to fetch indexers from Jackett."
    exit 1
fi

# Encode each indexer to base64 for safe iteration
indexers=$(echo "$jackett_json" | jq -c '.[]' | base64)

count=$(echo "$jackett_json" | jq '. | length')
log_info "Found $count indexers in Jackett."

# -------------------------
# LOOP AND ADD TO RADARR
# -------------------------
for idx in $indexers; do
    # Decode base64
    _jq() {
        echo "${idx}" | base64 --decode | jq -r "$1"
    }

    # Extract info
    name=$(_jq '.title')
    torznab_url=$(_jq '.Torznab')

    if [[ "$torznab_url" == "null" || -z "$torznab_url" ]]; then
        log_error "Skipping indexer '$name': no Torznab URL found."
        continue
    fi

    # Prepare JSON payload
    json_payload=$(jq -n \
        --arg name "$name" \
        --arg url "$torznab_url" \
        '{
            name: $name,
            implementationName: "Torznab",
            protocol: "Torznab",
            enable: true,
            fields: [
                {name: "Url", value: $url},
                {name: "ApiKey", value: env.JACKETT_API_KEY}
            ]
        }'
    )

    # Send POST to Radarr
    response=$(curl -s -w "%{http_code}" -o /tmp/radarr_resp.json -X POST "$RADARR_URL/api/v3/indexer" \
        -H "X-Api-Key: $RADARR_API_KEY" \
        -H "Content-Type: application/json" \
        -d "$json_payload")

    http_code="${response:(-3)}"  # extract last 3 chars (HTTP status code)
    resp_body=$(cat /tmp/radarr_resp.json)

    if [[ "$http_code" =~ ^2 ]]; then
        log_info "Successfully added indexer: $name"
    else
        log_error "Failed to add indexer: $name. HTTP $http_code. Response: $resp_body"
    fi
done

log_info "Done adding Jackett indexers to Radarr."

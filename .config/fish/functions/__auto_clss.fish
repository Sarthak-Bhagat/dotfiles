# Listing on every directory change. Autoloaded functions cannot register
# event handlers reliably, so the --on-variable binding lives in
# conf.d/26-hooks.fish and calls this.
function __auto_clss --description "List directory contents after cd"
    status is-interactive; and clss
end

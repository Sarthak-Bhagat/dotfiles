# Event handlers. These must exist when the event fires, so they are defined
# here rather than autoloaded from functions/.

status is-interactive; or exit 0

# List the directory after every cd.
function __auto_clss_hook --on-variable PWD --description "Run clss on directory change"
    status is-interactive; and clss
end

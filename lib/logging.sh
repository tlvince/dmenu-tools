##
# Print an informational message to stdout.
#
# @param $1 string  An arbitrary informational message.
#
info()
{
    echo "$(basename "$0"): $1"
    [[ $LOG ]] && echo "$(date +"%F %T") :: $1" >> "$LOG"
}

##
# Prefix a warning message and redirect to stderr.
#
# @param $1 string  An arbitrary warning message.
#
warn()
{
    info "error: $1" >&2
}

##
# Print an error message and exit.
#
# @param $1 string  An arbitrary error message.
# @param $2 int     An optional arbitrary exit code, otherwise the exit code of
#                   the last ran command.
#
die()
{
    local st="$?"
    warn "$1"
    [[ $2 ]] && exit $2 || exit $st
}

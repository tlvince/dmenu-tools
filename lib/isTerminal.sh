##
# Check to see if standard input is a terminal.
#
# @param $1 string  The executable name of a terminal (defaults to urxvtc).
# @param $2 string  A command to run in a new terminal (defaults to $0).
#
isTerminal()
{
    local CANONICAL="$(readlink -f "$0")"

    [[ -z $1 ]] && set "urxvtc"
    [[ -z $2 ]] && set "$1" "$CANONICAL"

    tty -s || "$1" -T "$(basename "$CANONICAL")" -e ${2}
}

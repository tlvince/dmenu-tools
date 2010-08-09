##
# If the given variable is not set, prompt to set it.
#
# Note: ${!1} is a bash-ism.
#
# @param $1 string  The name of a variable.
# @param $2 string  An arbitrary prompt, corresponding to $1.
#
isSet()
{
    [[ -z ${!1} ]] && read -p "$2" $1 && isSet "$@"
}

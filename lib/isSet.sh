##
# If the given variable is not set, prompt to set it.
#
# @param $1 string  The name of a variable.
# @param $2 string  An arbitrary prompt, corresponding to $1.
#
isSet()
{
    eval tmp=\$$1
    [[ -z $tmp ]] && read -p "$2" $1 && isSet "$@"
}

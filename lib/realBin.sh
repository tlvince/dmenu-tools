##
# Return "real" location of a given application.
#
# @param $1     The application.
# @return       The location of the "real" binary, otherwise exit code 1.
#
realBin()
{
    which --skip-tilde "$1" 2>/dev/null || return 1
}

# dmenu_edit

Use `dmenu` to open and edit a file from a given list.

## Usage

1. Create a newline seperated list of files in:

        ${XDG_LOCAL_HOME:-$HOME/.local/share}/dmenu/edit.txt

   This path can also be set at runtime:

        $ LOCAL="/tmp/edit.txt" dmenu_edit

2. Confirm the environment variables `$TERMINAL` and `$EDITOR` are set

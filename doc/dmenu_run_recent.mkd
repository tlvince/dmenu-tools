# dmenu_run_recent

Sort `dmenu` items by usage.

## Usage

`dmenu_run_recent` creates a cache file along side that of `dmenu_run`'s,
suffixed with `_recent`. An alternative cache file can also be passed at
runtime:

    $ CACHE="/tmp/my.cache" dmenu_run_recent

#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

function destname {
	local -r name="$1"
	local -r dest="$(printf -- "%s" "$name" | sed -e 's!--!/!g')"
	printf -- "%s/%s" "$HOME" "$dest"
}

declare dest

for src in *; do
	if [ "$src" == 'install.sh' ]; then
		continue
	fi
	dest="$(destname "$src")"
	printf -- "  [LN] %s => %s\n" "$src" "$dest"
	rm -f -- "$dest"
	mkdir -p -- "$(dirname -- "$dest")"
	ln -s -- "$PWD/$src" "$dest"
done

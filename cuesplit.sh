#!/bin/bash
set -o nounset                              # Treat unset variables as an error

usage() { cat << EOF
Syntax: splitcue [cuefile] [origfile]
EOF
}
case $1 in 
	-h )
		usage;;
	* )

		shntool split -f $1 -o 'flac flac --output-name %f -' -t '%n-%p-%t' $2
		cuetags.sh *.cue *.flac;;
esac

echo ""
echo "Complete"
exit 0

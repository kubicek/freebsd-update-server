#!/bin/sh -e

# $FreeBSD: projects/freebsd-update-server/tools/umirror-release.sh,v 1.1 2009/09/01 10:49:16 cperciva Exp $

# Check parameters
PRIVDIR=$1
PUBDIR=$2
if [ -z "${PRIVDIR}" -o -z "${PUBDIR}" ]; then
	echo "usage: $0 <privdir> <pubdir>"
	exit 1
fi

# Move keys into the public directory
while read ID X Y; do
	if [ -f "${PRIVDIR}/key-${ID}" ]; then
		mv "${PRIVDIR}/key-${ID}" "${PUBDIR}/key-${ID}"
	fi
done < "${PRIVDIR}/flist"

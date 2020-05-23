#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -r '/^(#.*|\s)*$/d; $! s/$/,/' package/dependencies | tr -d \\n)
git_commit=$(git rev-parse --short HEAD)

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://nxos.org" \
	"Package: nitrux-hardware-drivers" \
	"Version: 1.0.8.17-$git_commit" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $deps" \
	"Architecture: amd64" \
	"Description: Hardware drivers metapackage for Nitrux."

equivs-build configuration

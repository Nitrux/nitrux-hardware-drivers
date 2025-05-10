#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)
git_commit=$(git rev-parse --short HEAD)

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://nxos.org" \
	"Package: nitrux-hardware-drivers-legacy" \
	"Version: 1.5.7-$git_commit" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $deps" \
	"Conflicts: nitrux-hardware-drivers" \
	"Recommends: broadcom-sta-common, broadcom-sta-dkms, broadcom-sta-source" \
	"Architecture: amd64" \
	"Description: Hardware drivers metapackage for Nitrux."

equivs-build configuration

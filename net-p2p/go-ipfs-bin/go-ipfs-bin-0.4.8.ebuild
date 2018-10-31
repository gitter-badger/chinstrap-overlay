# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator
MY_PV=$(replace_version_separator 3 '-')
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="go-ipfs is the main implementation of IPFS."
HOMEPAGE="https://ipfs.io/"
SRC_URI="amd64? ( http://ipfs.io/ipns/dist.ipfs.io/go-ipfs/v${MY_PV}/go-ipfs_v${MY_PV}_linux-amd64.tar.gz )
	x86? ( http://ipfs.io/ipns/dist.ipfs.io/go-ipfs/v${MY_PV}/go-ipfs_v${MY_PV}_linux-386.tar.gz )"
# Also available arches:
#	arm? ( https://dist.ipfs.io/go-ipfs/v${PVR}/go-ipfs_v${PVR}_linux-arm.tar.gz )

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="+fuse"

RDEPEND="fuse? ( sys-fs/fuse )"
S="${WORKDIR}/go-ipfs"

QA_PREBUILT="/usr/bin/ipfs"

src_install() {
	dobin ipfs
}

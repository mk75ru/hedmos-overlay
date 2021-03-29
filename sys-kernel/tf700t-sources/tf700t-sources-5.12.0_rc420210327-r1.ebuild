# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE=sources
K_DEFCONFIG="tegra3_defconfig"
K_SECURITY_UNSUPPORTED=1
EXTRAVERSION="-${PN}/-*"
inherit kernel-2
detect_version
detect_arch

inherit git-r3 eapi7-ver
EGIT_REPO_URI="https://github.com/clamor95/linux.git -> tf700t-linux.git"
EGIT_BRANCH="master"
GIT_COMMIT="c1c0020b1593cb3cbdfa415ab618fbe180ac572b"
EGIT_CHECKOUT_DIR="${WORKDIR}/linux-${PV/_/-}-tf700t"
EGIT_CLONE_TYPE="shallow"
SRC_URI="https://raw.githubusercontent.com/hedmo/stuff/main/dot_files/.config-transformers -> .config"
DESCRIPTION="Asus Transformers pad tf700t kernel sources"
HOMEPAGE="https://github.com/clamor95/linux"

KEYWORDS=""

src_unpack() {
	git-r3_src_unpack
	unpack_set_extraversion
}

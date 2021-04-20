# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ETYPE=sources
K_DEFCONFIG="tegra3_defconfig"
K_SECURITY_UNSUPPORTED=1
EXTRAVERSION=""
inherit kernel-2
detect_version
detect_arch

DESCRIPTION="tegra3 kernel sources"
HOMEPAGE="https://github.com/grate-driver/linux"

inherit  eapi7-ver
IUSE="config cacule"
COMMIT="b4d9013d4b0302c0507c249878dd2d4ed5d6d6c3"
EXTRAS_URI="https://raw.githubusercontent.com/hedmo/stuff/main"
SRC_URI="
https://github.com/clamor95/linux/archive/${COMMIT}.tar.gz -> linux-${KV_FULL}.tar.gz
	config? ( ${EXTRAS_URI}/dot_files/.config-transformers -> .config )
	cacule? ( ${EXTRAS_URI}/patches/cacule-5-grate-dev.patch )
"

KEYWORDS="~arm"

src_unpack() {
	default

	# We want to rename the unpacked directory to a nice normalised string
	# bug #762766
	mv "${WORKDIR}"/linux-${COMMIT} "${WORKDIR}"/linux-${KV_FULL} || die
}

src_prepare() {
default

	#if one wants to use my .config
	if use config; then
	cp "${DISTDIR}"/.config "${WORKDIR}"/linux-${KV_FULL}/ || die
	fi

	if use cacule; then
		eapply "${DISTDIR}/cacule-5-grate-dev.patch" || die
	fi
}

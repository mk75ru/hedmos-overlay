# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit qt5-build

DESCRIPTION="Application scripting library for the Qt5 framework (deprecated)"

if [[ ${QT5_BUILD_TYPE} == release ]]; then
	KEYWORDS="amd64 ~arm arm64 ~hppa ppc ppc64 ~sparc x86"
fi

IUSE="+jit scripttools"

DEPEND="
	~dev-qt/qtcore-${PV}
	scripttools? (
		~dev-qt/qtgui-${PV}
		~dev-qt/qtwidgets-${PV}
	)
"
RDEPEND="${DEPEND}"

src_prepare() {
	qt_use_disable_mod scripttools widgets \
		src/src.pro

	qt5-build_src_prepare
}

src_configure() {
	local myqmakeargs=(
		JAVASCRIPTCORE_JIT=$(usex jit 'yes' 'no')
	)
	qt5-build_src_configure
}

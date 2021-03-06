# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools-utils

MY_P=${P/${PN}/${PN}-alpha}
DESCRIPTION="Library and tools to access the Windows Shortcut File (LNK) Format"
HOMEPAGE="https://code.google.com/p/liblnk/"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x64-macos ~x86-macos"
IUSE="debug nls python unicode"

DEPEND="
	nls? (
		virtual/libintl
		virtual/libiconv
	)
	python? ( dev-lang/python )
	dev-libs/libbfio
	dev-libs/libuna"

AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
	local myeconfargs=( '--disable-rpath'
		$(use_enable nls)
		$(use_with nls libiconv-prefix)
		$(use_with nls libintl-prefix)
		$(use_enable debug debug-output)
		$(use_enable debug verbose-output)
		$(use_enable unicode wide-character-type)
		$(use_enable python)
	)
	autotools-utils_src_configure
}

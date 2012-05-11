# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MY_P=${P/${PN}/${PN}-alpha}
DESCRIPTION="Library and tools to access the Windows Shortcut File (LNK) Format"
HOMEPAGE="http://liblnk.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-alpha/${MY_P}/${MY_P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x64-macos ~x86-macos"
IUSE="debug nls unicode"

DEPEND="nls? ( virtual/libintl )
	dev-libs/libbfio
	dev-libs/libuna
	dev-libs/libfguid
	dev-libs/libfdatetime"

src_configure() {
	econf --disable-rpath \
		$(use_enable nls) \
		$(use_enable debug debug-output) \
		$(use_enable debug verbose-output) \
		$(use_enable unicode wide-character-type)
}

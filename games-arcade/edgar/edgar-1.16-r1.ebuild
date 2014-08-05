# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# TODO:
# - makefile patch to include CFLAGS
# - doc USE flag/makefile patch
# - test USE flag/makefile patch
# - locale USE flags/makefile patch
# - fix incorrect desktop file, push upstream
# - icon(s)

EAPI=5
inherit eutils games

if [[ ${PR} == 'r0' ]]
then
	MY_PVR=${PVR}
else
	MY_PR=${PR##r}
	MY_PVR="${PV}-${MY_PR}"
fi

DESCRIPTION='A 2D platform game with a persistent world.'
HOMEPAGE='http://legendofedgar.sourceforge.net/'
SRC_URI="mirror://sourceforge/project/legendofedgar/${PV}/${PN}-${MY_PVR}.tar.gz"

LICENSE='GPL-2'
SLOT='0'
KEYWORDS='x86'
IUSE=''

DEPEND="media-libs/libsdl
	media-libs/sdl-mixer
	media-libs/sdl-ttf"

src_install() {
	emake DESTDIR="${D}" BIN_DIR="${D}/usr/games/bin/" install
}

# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Adjust the color temperature of your screen according to your surroundings"
HOMEPAGE="https://gitlab.com/chinstrap/gammastep"
SRC_URI="https://gitlab.com/chinstrap/${PN}/-/archive/v${PV}/${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-misc/geoclue
		sys-libs/glibc
		x11-themes/hicolor-icon-theme
		x11-libs/libdrm
		x11-libs/libX11
		x11-libs/libxcb
		x11-libs/libXxf86vm
		dev-libs/wayland"
RDEPEND="${DEPEND}"
BDEPEND="sys-apps/systemd
		dev-lang/python
		dev-util/intltool
		dev-libs/glib"

src_prepare() {
	./bootstrap
}

src_configure() {
	./configure --prefix=/usr
	make
}

src_install() {
	make DESTDIR="${D}" install
	install -vDm 644 {CONTRIBUTING,NEWS,README}.md -t "${D}/usr/share/doc/${PN}"
}

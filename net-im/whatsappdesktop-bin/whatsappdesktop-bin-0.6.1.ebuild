# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils desktop

DESCRIPTION="Unofficial whatsapp web desktop client"
HOMEPAGE="https://web.whatsapp.com/"
SRC_URI="http://packages.linuxmint.com/pool/import/w/whatsapp-desktop/whatsapp-desktop_${PV}_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
		bsdtar -xvf data.tar.xz -C "${D}"
		chmod -R g-w "${D}"/{usr,opt}
}

pkg_postinst() {
	domenu /usr/share/applications/whatsappdesktop.desktop
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

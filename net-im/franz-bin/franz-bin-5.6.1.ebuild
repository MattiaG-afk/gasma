# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils desktop

DESCRIPTION="Free messaging app for services like WhatsApp, Slack, Messenger and many more."
HOMEPAGE="http://meetfranz.com/"
SRC_URI="https://github.com/meetfranz/franz/releases/download/v5.6.1/franz_${PV}_amd64.deb"

S="/var/tmp/portage/net-im/franz-bin-5.6.1/work"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

src_install() {
	bsdtar -xvf data.tar.xz -C "${D}"
	chmod -R g-w "${D}"/{usr,opt}
}

pkg_postinst() {
	domenu /usr/share/applications/franz.desktop
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

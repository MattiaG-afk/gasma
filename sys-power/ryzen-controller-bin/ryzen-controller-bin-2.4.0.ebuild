# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils

DESCRIPTION="A minimal Electron application to use ryzenAdj through a friendly interface"
HOMEPAGE="https://gitlab.com/ryzen-controller-team/ryzen-controller"
SRC_URI="https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/1151742724/artifacts/raw/dist/deb/ryzen-controller_2.4.0_amd64.deb"

LICENSE="CC0 1.0 Universal"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="/var/tmp/portage/sys-power/ryzen-controller-bin-2.4.0/work"

DEPEND="sys-power/RyzenAdj"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	bsdtar -xvf data.tar.xz -C "${D}"
	chmod -R g-w "${D}"/{usr,opt}
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

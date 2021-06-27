# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="TUI Application launcher with Desktop Entry support"
HOMEPAGE="https://github.com/Biont/sway-launcher-desktop"
SRC_URI="https://github.com/Biont/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-shells/fzf"
RDEPEND="${DEPEND}"

src_install() {
        install -d "${D}/usr/bin/"
        install -m 755 "${PN}.sh" "${D}/usr/bin/${PN}"
}

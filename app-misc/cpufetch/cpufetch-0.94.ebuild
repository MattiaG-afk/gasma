# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simplistic yet fancy CPU architecture fetching tool"
HOMEPAGE="https://github.com/Dr-Noob/${PN}"
SRC_URI="https://github.com/Dr-Noob/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	emake
}

src_install() {
	insinto /usr/bin
	doins ${S}/cpufetch
	fperms +x /usr/bin/${PN}
}

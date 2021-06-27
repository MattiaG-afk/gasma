# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Adjust power management settings for Mobile Raven Ridge Ryzen Processors"
HOMEPAGE="https://github.com/FlyGoat/${PN}"
SRC_URI="https://github.com/FlyGoat/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-apps/pciutils"
RDEPEND="${DEPEND}"

src_prepare() {
	rm -r win32 .github .gitignore
	eapply_user
}

src_compile() {
	mkdir build && cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

src_install() {
	install -Dsm 755 build/ryzenadj ${D}/usr/bin/ryzenadj
	install -Dsm 744 build/libryzenadj.so ${D}/usr/lib64/libryzenadj.so
}

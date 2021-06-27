# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Day/night gamma adjustments for Wayland compositors"
HOMEPAGE="https://sr.ht/~kennylevinsen/wlsunset"
SRC_URI="https://git.sr.ht/~kennylevinsen/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/wayland"
RDEPEND="${DEPEND}"
BDEPEND="dev-libs/wayland-protocols
		dev-libs/wayland-protocols
		dev-libs/wayland-protocols"

src_configure() {
	meson build
	ninja -C build
}

src_install() {
	DESTDIR="${D}" ninja -C build install
	install -Dm644 LICENSE "${D}/usr/share/licenses/${PN}/LICENSE"
}

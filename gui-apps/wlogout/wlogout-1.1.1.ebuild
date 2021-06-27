# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A wayland based logout menu"
HOMEPAGE="https://github.com/ArtsyMacaw/wlogout"
SRC_URI="https://github.com/ArtsyMacaw/wlogout/archive/refs/tags/1.1.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/gtk+
                dev-libs/gobject-introspection
                gui-libs/gtk-layer-shell"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson
                dev-util/ninja"

src_compile() {
        meson build --prefix ${D}/usr
        ninja -C build
}

src_install() {
        DESTDIR="${D}" ninja -C build install
}

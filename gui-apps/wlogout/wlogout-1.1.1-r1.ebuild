# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson ninja-utils

DESCRIPTION="A wayland based logout menu"
HOMEPAGE="https://github.com/ArtsyMacaw/wlogout"
SRC_URI="https://github.com/ArtsyMacaw/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-comlpetions fish-completions zsh-completions"

DEPEND="x11-libs/gtk+
		dev-libs/gobject-introspection
		man-pages? ( app-text/scdoc )
		layershell? ( gui-libs/gtk-layer-shell )"
RDEPEND="${DEPEND}"

src_configure {
	sed "s/@LIBDIR@/$(get_libdir)/" -i meson.build
	local emesonarg=(
		$(meson_use layershell)
		$(meson_use man-pages)
		$(meson_use bash-completions)
		$(meson_use fish-completions)
		$(meson_use zsh-comlpetions)
		BUILD_DIR="${WORKDIR}/${P}"
	)

	meson_src_configure
	eninja -c build
	eninja -c build install
}

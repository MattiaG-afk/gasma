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
IUSE="layershell man-pages bash-completions fish-completions zsh-completions"

DEPEND="x11-libs/gtk+:=
		dev-libs/gobject-introspection
		man-pages? ( app-text/scdoc )
		layershell? ( gui-libs/gtk-layer-shell )"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonarg=(
		$(meson_use layershell)
		$(meson_use man-pages)
		$(meson_use bash-completions)
		$(meson_use fish-completions)
		$(meson_use zsh-completions)
	)

	meson_src_configure
}

src_compile() {
	meson_src_compile
	eninja -C "$BUILD_DIR"
}

src_install() {
	# Install exe file
	exeinto /usr/local/bin
	doexe "${BUILD_DIR}/${PN}"

	# Install completions if enabled
	if use bash-completions; then
		insinto /usr/local/share/bash-completions/
		doins "${BUILD_DIR}/${PN}.bash" "completions"
	fi
	if use fish-completions; then
		insinto /usr/local/share/fish/
		doins "${BUILD_DIR}/${PN}.fish" "completions"
	fi
	if use zsh-completions; then
		insinto /usr/local/share/zsh/
		doins "${BUILD_DIR}/_${PN}" "site-functions"
	fi

	# Install docs
	if use man-pages; then
		dodoc "${BUILD_DIR}/${PN}.1" "${BUILD_DIR}/${PN}.5"
	fi
}

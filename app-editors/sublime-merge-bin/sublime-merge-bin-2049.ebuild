# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils
DESCRIPTION="Commit Faster Stage Files, Hunks and Lines with no waiting - Sublime Merge is really, really fast."
HOMEPAGE="https://www.sublimemerge.com/"
SRC_URI="https://download.sublimetext.com/sublime-merge_build-${PV}_amd64.deb"

LICENSE="Sublime"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

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

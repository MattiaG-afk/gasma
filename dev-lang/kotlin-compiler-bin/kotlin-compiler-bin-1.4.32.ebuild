# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Kotlin Programming Language"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-java/openjdk"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/bin
	doins ${S}/kotlinc/bin/*
}

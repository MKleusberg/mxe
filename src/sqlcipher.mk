# This file is part of MXE.
# See index.html for further information.

PKG             := sqlcipher
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.0
$(PKG)_CHECKSUM := 44af36d34f05154a7527a55389d9bc0ef0913595
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)_SUBDIR.tar.gz
$(PKG)_URL      := https://github.com/sqlcipher/sqlcipher/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := gcc openssl

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/sqlcipher/sqlcipher/tags' | \
    $(SED) -n 's,.*href="/sqlcipher/sqlcipher/archive/v\([0-9][^"]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(MXE_CONFIGURE_OPTS) \
        --disable-readline \
        --enable-threadsafe \
        --enable-load-extension \
        CFLAGS="-Os"
    $(MAKE) -C '$(1)' -j '$(JOBS)' install
endef

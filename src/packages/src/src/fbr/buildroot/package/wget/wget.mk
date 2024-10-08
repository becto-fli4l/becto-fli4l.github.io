################################################################################
#
# wget
#
################################################################################

WGET_VERSION = 1.19.5
WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
WGET_SITE = $(BR2_GNU_MIRROR)/wget
WGET_DEPENDENCIES = host-pkgconf
WGET_LICENSE = GPL-3.0+
WGET_LICENSE_FILES = COPYING

WGET_CONF_ENV = ac_cv_header_pcre_h=no \
                gl_cv_func_gettimeofday_clobber=no \
                gl_cv_func_tzset_clobber=no

WGET_CONF_OPTS += --disable-pcre

ifeq ($(BR2_PACKAGE_GNUTLS),y)
WGET_CONF_OPTS += --with-ssl=gnutls
WGET_DEPENDENCIES += gnutls
else ifeq ($(BR2_PACKAGE_OPENSSL),y)
WGET_CONF_OPTS += --with-ssl=openssl
WGET_DEPENDENCIES += openssl
else
WGET_CONF_OPTS += --without-ssl
endif

ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
WGET_DEPENDENCIES += util-linux
endif

ifeq ($(BR2_PACKAGE_LIBICONV),y)
	WGET_DEPENDENCIES += libiconv
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
WGET_CONF_OPTS += --with-zlib
WGET_DEPENDENCIES += zlib
else
WGET_CONF_OPTS += --without-zlib
endif

$(eval $(autotools-package))

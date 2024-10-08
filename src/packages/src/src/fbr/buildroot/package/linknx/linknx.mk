################################################################################
#
# linknx
#
################################################################################

LINKNX_VERSION = 0.0.1.36
LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
LINKNX_LICENSE = GPL-2.0+
LINKNX_INSTALL_STAGING = YES
LINKNX_CONF_OPTS = \
	--without-log4cpp \
	--without-pth-test \
	--with-pth=$(STAGING_DIR)/usr \
	--disable-smtp
LINKNX_CONF_ENV = LIBS="-ldl -liconv"

LINKNX_DEPENDENCIES = libpthsem libiconv \
	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)

ifeq ($(BR2_PACKAGE_LIBCURL),y)
LINKNX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
LINKNX_DEPENDENCIES += libcurl
else
LINKNX_CONF_OPTS += --without-libcurl
endif

ifeq ($(BR2_PACKAGE_LUA),y)
LINKNX_CONF_OPTS += --with-lua
LINKNX_DEPENDENCIES += lua
else
LINKNX_CONF_OPTS += --without-lua
endif

ifeq ($(BR2_PACKAGE_MYSQL),y)
LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
LINKNX_DEPENDENCIES += mysql
else
LINKNX_CONF_OPTS += --without-mysql
endif

ifeq ($(BR2_PACKAGE_LUA),y)
LINKNX_CONF_OPTS += --with-lua
LINKNX_DEPENDENCIES += lua
else
LINKNX_CONF_OPTS += --without-lua
endif

ifeq ($(BR2_PACKAGE_LIBCURL),y)
LINKNX_CONF_OPTS += --with-libcurl
LINKNX_DEPENDENCIES += libcurl
else
LINKNX_CONF_OPTS += --without-libcurl
endif

$(eval $(autotools-package))

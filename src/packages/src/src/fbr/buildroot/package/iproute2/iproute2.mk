################################################################################
#
# iproute2
#
################################################################################

IPROUTE2_VERSION = 4.18.0
IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
	$(if $(BR2_PACKAGE_LIBMNL),libmnl) \
	$(if $(BR2_PACKAGE_LIBCAP),libcap)
IPROUTE2_LICENSE = GPL-2.0+
IPROUTE2_INSTALL_STAGING = YES
IPROUTE2_LICENSE_FILES = COPYING

IPROUTE2_MAKE_ENV = \
	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

ifeq ($(BR2_PACKAGE_ELFUTILS),y)
IPROUTE2_DEPENDENCIES += elfutils
endif

# If we've got iptables enable xtables support for tc
ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
IPROUTE2_DEPENDENCIES += iptables
define IPROUTE2_WITH_IPTABLES
	# Makefile is busted so it never passes IPT_LIB_DIR properly
	$(SED) "s/-DIPT/-DXT/" $(@D)/tc/Makefile
endef
else
define IPROUTE2_WITH_IPTABLES
	# m_xt.so is built unconditionally
	echo "TC_CONFIG_XT:=n" >>$(@D)/config.mk
endef
endif

# arpd needs BerkeleyDB and links against pthread
ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
IPROUTE2_DEPENDENCIES += berkeleydb
else
define IPROUTE2_DISABLE_ARPD
	echo "HAVE_BERKELEY_DB:=n" >> $(@D)/config.mk
endef
endif

# ifcfg needs bash
ifeq ($(BR2_PACKAGE_BASH),)
define IPROUTE2_REMOVE_IFCFG
	rm -f $(TARGET_DIR)/sbin/ifcfg
endef
endif

define IPROUTE2_CONFIGURE_CMDS
	$(SED) 's/gcc/$$CC $$CFLAGS/g' $(@D)/configure
	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
	$(IPROUTE2_DISABLE_ARPD)
	$(IPROUTE2_WITH_IPTABLES)
endef

define IPROUTE2_BUILD_CMDS
	$(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
	+$(TARGET_MAKE_ENV) $(IPROUTE2_MAKE_ENV) LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) \
		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
		CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
		SHARED_LIBS="$(if $(BR2_STATIC_LIBS),n,y)" V=1 -C $(@D)
endef

define IPROUTE2_INSTALL_STAGING_CMDS
	$(INSTALL) -D $(@D)/lib/libnetlink.a $(STAGING_DIR)/usr/lib/libnetlink.a
	$(INSTALL) -D $(@D)/include/libnetlink.h $(STAGING_DIR)/usr/include/iproute/libnetlink.h
endef

define IPROUTE2_INSTALL_TARGET_CMDS
	+$(TARGET_MAKE_ENV) $(IPROUTE2_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" \
		SBINDIR=/sbin \
		DOCDIR=/usr/share/doc/iproute2-$(IPROUTE2_VERSION) \
		MANDIR=/usr/share/man install
	$(IPROUTE2_REMOVE_IFCFG)
endef

$(eval $(generic-package))

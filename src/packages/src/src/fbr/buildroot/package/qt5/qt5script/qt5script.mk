################################################################################
#
# qt5script
#
################################################################################

QT5SCRIPT_VERSION = $(QT5_VERSION)
QT5SCRIPT_SITE = $(QT5_SITE)
QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
QT5SCRIPT_DEPENDENCIES = qt5base
QT5SCRIPT_INSTALL_STAGING = YES

# JavaScriptCore contains files under BSD-2-Clause, BSD-3-Clause, and LGPL-2+.
# This is linked into libQt5Script, which also contains Qt sources under
# LGPL-2.1 (only). Therefore, the library is  LGPL-2.1 and BSD-3-Clause.
# libQt5ScriptTools is under the normal Qt opensource license.
ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
QT5SCRIPT_LICENSE = LGPL-2.1, BSD-3-Clause, LGPL-3.0 or GPL-2.0+ (libQt5ScriptTools), GFDL-1.3 (docs)
QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv3 LICENSE.FDL
else
QT5SCRIPT_LICENSE = LGPL-2.1, BSD-3-Clause, LGPL-2.1 with exception or LGPL-3.0 with exception (libQt5ScriptTools), GFDL-1.3 (docs)
QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LGPL_EXCEPTION.txt LICENSE.FDL
endif
# License files from JavaScriptCore
QT5SCRIPT_LICENSE_FILES += \
	src/3rdparty/javascriptcore/JavaScriptCore/COPYING.LIB \
	src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING

define QT5SCRIPT_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
endef

define QT5SCRIPT_BUILD_CMDS
	+$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5SCRIPT_INSTALL_STAGING_CMDS
	+$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_STATIC_LIBS),)
define QT5SCRIPT_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Script*.so.* $(TARGET_DIR)/usr/lib
endef
endif

$(eval $(generic-package))

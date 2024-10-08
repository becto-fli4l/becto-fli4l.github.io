################################################################################
#
# qt5multimedia
#
################################################################################

QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
QT5MULTIMEDIA_SITE = $(QT5_SITE)
QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
QT5MULTIMEDIA_DEPENDENCIES = qt5base
QT5MULTIMEDIA_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
else
QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
endif

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
endif

ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
QT5MULTIMEDIA_DEPENDENCIES += libglib2 pulseaudio
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
endif

# The mesa's EGL/eglplatform.h header includes X11 headers unless the flag
# MESA_EGL_NO_X11_HEADERS is defined. Tell to not include X11 headers if
# the libxcb is not selected.
ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)x$(BR2_PACKAGE_LIBXCB),yx)
QT5MULTIMEDIA_QMAKEFLAGS += QMAKE_CXXFLAGS+=-DMESA_EGL_NO_X11_HEADERS
endif

define QT5MULTIMEDIA_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5MULTIMEDIA_QMAKEFLAGS))
endef

define QT5MULTIMEDIA_BUILD_CMDS
	+$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
	+$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_STATIC_LIBS),)
ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
endef
endif

define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
	$(QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB)
endef
endif

# this is only built with quick/opengl support enabled
ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5_GL_AVAILABLE),yy)
define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
endef
endif

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
endef
endif

define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
	$(QT5MULTIMEDIA_INSTALL_TARGET_QMLS)
	$(QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES)
endef

$(eval $(generic-package))

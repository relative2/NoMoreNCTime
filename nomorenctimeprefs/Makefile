SDKVERSION = 11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk
ARCHS = arm64
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NoMoreNCTimePrefs
NoMoreNCTimePrefs_FILES = NTMRootListController.m
NoMoreNCTimePrefs_INSTALL_PATH = /Library/PreferenceBundles
NoMoreNCTimePrefs_FRAMEWORKS = UIKit
NoMoreNCTimePrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NoMoreNCTimePrefs.plist$(ECHO_END)

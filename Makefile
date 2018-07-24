SDKVERSION = 11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk
ARCHS = arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoMoreNCTime
NoMoreNCTime_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += nomorenctimeprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

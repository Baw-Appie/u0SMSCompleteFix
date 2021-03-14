TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = u0SMSCompleteFix

u0SMSCompleteFix_FILES = Tweak.x
u0SMSCompleteFix_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

SUBPROJECTS += mobileu0smscompletefix

include $(THEOS_MAKE_PATH)/aggregate.mk

include $(THEOS_MAKE_PATH)/tweak.mk

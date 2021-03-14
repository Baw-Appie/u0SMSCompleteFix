ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TOOL_NAME = mobileu0smscompletefix

mobileu0smscompletefix_FILES = main.m
mobileu0smscompletefix_CFLAGS = -fobjc-arc
mobileu0smscompletefix_CODESIGN_FLAGS = -Sent.xml

include $(THEOS_MAKE_PATH)/tool.mk

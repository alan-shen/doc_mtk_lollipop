LOCAL_PATH:=$(call my-dir)
include $(CLEAR_VARS)
LOCAL_SRC_FILES:=test.c
LOCAL_MODULE:=test
include $(BUILD_EXECUTABLE)

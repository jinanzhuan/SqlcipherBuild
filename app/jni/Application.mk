APP_ABI := armeabi-v7a arm64-v8a x86 x86_64
#APP_ABI := arm64-v8a x86_64
APP_STL := gnustl_static #GNU STL
APP_CPPFLAGS +=-std=c++11 #允许使用c++11的函数等功能
LOCAL_MULTILIB := 32
APP_PLATFORM=android-11

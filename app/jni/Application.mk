APP_ABI := armeabi-v7a arm64-v8a x86 x86_64
#APP_ABI := arm64-v8a x86_64
APP_CPPFLAGS +=-std=c++11 #允许使用c++11的函数等功能
APP_STL := c++_static
LOCAL_MULTILIB := 32
APP_PLATFORM=android-21

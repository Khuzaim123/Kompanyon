@echo off
"D:\\Android-Sdk\\Sdk\\cmake\\3.22.1\\bin\\cmake.exe" ^
  "-HD:\\Flutter\\flutter\\packages\\flutter_tools\\gradle\\src\\main\\groovy" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=21" ^
  "-DANDROID_PLATFORM=android-21" ^
  "-DANDROID_ABI=x86" ^
  "-DCMAKE_ANDROID_ARCH_ABI=x86" ^
  "-DANDROID_NDK=D:\\Android-Sdk\\Sdk\\ndk\\26.3.11579264" ^
  "-DCMAKE_ANDROID_NDK=D:\\Android-Sdk\\Sdk\\ndk\\26.3.11579264" ^
  "-DCMAKE_TOOLCHAIN_FILE=D:\\Android-Sdk\\Sdk\\ndk\\26.3.11579264\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=D:\\Android-Sdk\\Sdk\\cmake\\3.22.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=D:\\Programing\\Flutter\\Task\\kompanyon\\build\\app\\intermediates\\cxx\\RelWithDebInfo\\354b5xih\\obj\\x86" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=D:\\Programing\\Flutter\\Task\\kompanyon\\build\\app\\intermediates\\cxx\\RelWithDebInfo\\354b5xih\\obj\\x86" ^
  "-DCMAKE_BUILD_TYPE=RelWithDebInfo" ^
  "-BD:\\Programing\\Flutter\\Task\\kompanyon\\android\\app\\.cxx\\RelWithDebInfo\\354b5xih\\x86" ^
  -GNinja ^
  -Wno-dev ^
  --no-warn-unused-cli

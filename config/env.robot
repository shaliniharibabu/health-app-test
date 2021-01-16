*** Variables ***
# tech-test.app(iOS) / app-release.apk(Android)
${APP_FILENAME}         app-release.apk
# ios or android
${APP_FOLDER}           android
${APP_PATH}             ${EXECDIR}${/}app${/}${APP_FOLDER}${/}${APP_FILENAME}
# Emulator name
${DEVICE_NAME}          Pixel_3a_API_30_x86
# Emulator id
${UDID}                 emulator-5554
# XCUITest(iOS) / UIAutomator2
${AUTOMATION_NAME}      UIAutomator2
# iOS / android
${PLATFORM_NAME}        android
# OS Version
${PLATFORM_VERSION}     11.0
# Appium server URL
${APPIUM_SERVER}        http://localhost:4723/wd/hub

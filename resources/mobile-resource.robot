*** Settings ***
Library         AppiumLibrary

*** Variable ***

*** Keywords ***
Abrir o aplicativo
  Open Application                http://localhost:4723/wd/hub
  ...                             automationName=UiAutomator2
  ...                             platformName=Android
  ...                             deviceName=emulator-5554
  ...                             autoGrantPermissions=true
  ...                             appPackage=com.google.android.youtube
  ...                             appActivity=com.google.android.youtube.HomeActivity

Fechar o aplicativo
  Capture Page Screenshot
  Close Application
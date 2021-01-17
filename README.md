# Hospital Mobile Test

This Test suite is created using RobotFramework and Appium to enable testing on both Android and IOS environments.

## Table of Contents
- [Hospital Mobile Test](#hospital-mobile-test)
  * [Dependencies](#dependencies)
  * [Prerequisite Setup](#prerequisite-setup)
    + [Brew](#brew)
    + [Python](#python)
    + [Node](#node)
    + [Android Studio](#android-studio)
    + [Appium](#appium)
  * [Setting up Android Emulator](#setting-up-android-emulator)
    + [Connecting Appium to Emulator for manual inspection](#connecting-appium-to-emulator-for-manual-inspection)
  * [Setting up Test framework](#setting-up-test-framework)
  * [Running the tests](#running-the-tests)
  * [Notes](#notes) 

## Dependencies

* Python 3.8
* node >= v15.6.0
* npm >= 7.4.0
* Java 14
* Android SDKs

The following setup guide is created and tested on ***MacOS Big Sur***.

## Prerequisite Setup

### Brew

Brew is a package manager in Mac which lets us install and manage packages on MacOS. Brew can be installed on the system by running the following command in terminal.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"	
```

### Python

Python can be installed using `pyenv` which enables us to switch between different python version on local machine with ease.

pyenv can be installed using brew.

```shell
$ brew install pyenv
```

Now python can be installed using `pyenv`.

```shell
$ pyenv install 3.8.2
```

Global version of python can be set by following command

```shell
$ pyenv global 3.7.3
```

Once the python is installed to persist the changes and let pyenv manage python version, add the following lines to **.zshrc** or **.bash_profile** file located in the user's home directory.

```shell
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
```

### Node

Node.js can be installed and managed using `nvm`, a node version manager.

```shell
$ brew install nvm
```

Create a new directory in user home directory for nvm to store mutliple versions of node

```shell
$ mkdir ~/.nvm
```

Once the nvm directory is created, add the following lines  to **.zshrc** or **.bash_profile** to enable nvm manage node versions.

```shell
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
```

Now node can be installed on the machine using `nvm` command

```shell
$ nvm install node
```

### Android Studio

Download and install [Android Studio](https://developer.android.com/studio) to use AVD manager and other tools such as `adb` and `emulator`.

Add the following lines to **.zshrc** or **.bash_profile** to enable use of Android platform tools within the system.

```shell
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}"
```

### Appium

1. Install Appium server on local

    ```shell
   $ npm install appium -g
   ```

2. Install Appium doctor to verify setup and requirements of local machine to work with Appium and respective devices. 

   ```shell
   $ npm install appium-doctor -g
   ```

3. Once appium doctor is installed, the requirements of local system can be verified using the following command.

   ```shell
   $ appium-doctor --android # For Android
   $ appium-doctor --ios # For IOS
   ```

4. Finally install [Appium Desktop](http://appium.io/) for manual inspection of Apps in local development system.



## Setting up Android Emulator

1. Start an Android Virtual Device (AVD) using the AVD Manager in Andorid Studio.

2. Once the emulator is started, install the app on the emulator.

   ```shell
   # find your running device
   % adb devices
   List of devices attached
   emulator-5554	device
   
   # install the sample app
   % adb -s emulator-5554 install -r app/android/app-release.apk
   Performing Streamed Install
   Success
   ```

   

### Connecting Appium to Emulator for manual inspection

1. Start the server on Appium Desktop. This Creates a server in `localhost` 4723 port by default.

2. Once the server is started, start a inspector session from the Appium console.

3. Add the following to the capabilities in JSON format in the automatic server. This could enable you to inspect the andorid app running in the emulator.

   ```json
   {
     "platformName": "android",
     "platformVersion": "11.0",
     "deviceName": "emulator-5554",
     "appPackage": "com.sensynehealth.hospitals",
     "appActivity": "com.sensynehealth.hospitals.MainActivity"
   }
   ```

   

## Setting up Test framework

1. Create a new virtual environment within the project directory.

   ```shell
   $ python -m venv venv
   ```

2. Activate the virtual environment in the project.

   ```shell
   $ source venv/bin/activate
   ```

3. Install framework dependencies.

   ```shell
   $ pip install -r requirements.txt
   ```

   

## Running the tests

The tests can be run using `robot` command

```shell
$ robot -d ./logs tests
```



## Notes

1. The result of the execution can be found in the `reports` folder on the respository. `reports.html` shows the result of all test executions. 
2. Bug report is documented in [Bug-Report.md](Bug-Report.md).
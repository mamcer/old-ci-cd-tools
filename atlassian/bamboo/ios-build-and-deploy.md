---
layout: post
title: iOS build and deploy
subtitle:  terminal friendly
---

# iOS build and deploy

## Build and Test

### Install Pods

    cd [working-dir]
    pod install

### Remove build folder 

    rm -rf [working-dir]/build
    
### Build project for the simulator (with the latest SDK installed)

    xcodebuild -workspace [my-project].xcworkspace -scheme [my-schema] -configuration Debug -sdk iphonesimulator clean build SYMROOT=[working-dir]/build CONFIGURATION_BUILD_DIR=[working-dir]/build CONFIGURATION_TEMP_DIR=[working-dir]/temp INSTALL_PATH=[working-dir]/ GCC_SYMBOLS_PRIVATE_EXTERN=NO GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES

### Test

    xcodebuild -workspace [my-project].xcworkspace -scheme [my-schema] -configuration Debug -sdk iphonesimulator test SYMROOT=[working-dir]/build CONFIGURATION_BUILD_DIR=[working-dir]/build CONFIGURATION_TEMP_DIR=[working-dir]/temp INSTALL_PATH=[working-dir]/ GCC_SYMBOLS_PRIVATE_EXTERN=NO GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES

## Generate ipa

### Build project for the device (with the latest SDK installed)

    xcodebuild -workspace [my-project].xcworkspace -scheme [my-schema] -configuration Release -sdk iphoneos build SYMROOT=[working-dir]/build 'CODE_SIGN_RESOURCE_RULES_PATH=$(SDKROOT)/ResourceRules.plist'

### Archive the project generating .ipa file

    xcrun -log -sdk iphoneos PackageApplication [working-dir]/build/Release-iphoneos/[my-project].app -o [working-dir]/[my-project].ipa -sign "[my-certificate-name]" -embed "[working-dir]/[my-provision-profile-filename].mobileprovision"




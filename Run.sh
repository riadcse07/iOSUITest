SCHEME=(  'BundleOne')
DEVICE_NAME=('iPhone 8 Plus')

cd HelloWorld
cd HelloWorld

# Below command builds the project with the scheme
xcodebuild build-for-testing -project "Hello World.xcodeproj" -scheme "BundleUiTest_Scheme" -destination "platform=iOS Simulator,name=iPhone 8 Plus,OS=11.0" -derivedDataPath "All"  
# Below command Runs the UITest with xcrun
xcodebuild test-without-building -xctestrun "All/Build/Products/BundleUiTest_Scheme_iphonesimulator11.0-x86_64.xctestrun" -destination "platform=iOS Simulator,name=${DEVICE_NAME[0]},OS=11.0" '-only-testing:'${SCHEME[0]}''  -derivedDataPath 'build/reports/'${SCHEME[0]}'' | tee xcodebuild.log  | ios-sim start --devicetypeid "iPhone-8-Plus, 11.0"

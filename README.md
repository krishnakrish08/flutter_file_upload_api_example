# flutter_file_upload_api

A Flutter project for File Uploading API.

## Step-by-Step Guide to Adding and Configuring the Podfile
Step 1: Navigate to the iOS Directory
First, navigate to the iOS directory of your Flutter project. You can do this using the terminal:
 
bash cd ios

# Step 2: Create the Podfile
If the Podfile does not already exist, you can create it by running the following command:

bash pod init
This command will generate a Podfile in the ios directory.

# Step 3: Edit the Podfile
Open the Podfile in a text editor. The path to the Podfile is ios/Podfile. Add the necessary configurations as shown below:

# Uncomment this line to define a global platform for your project
platform :ios, '10.0'

# CocoaPods analytics sends network stats synchronously affecting flutter build latency.
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

project 'Runner', {
'Debug' => :debug,
'Profile' => :release,
'Release' => :release,
}

# Prevent Cocoapods from embedding a second Flutter framework and causing an error.
install! 'cocoapods', :disable_input_output_paths => true

target 'Runner' do
use_frameworks!
use_modular_headers!

flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end

post_install do |installer|
installer.pods_project.targets.each do |target|
flutter_additional_ios_build_settings(target)
end
end


# Step 4: Install the Pods
After editing the Podfile, you need to install the pods. Run the following command in the ios directory:

$ pod install

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

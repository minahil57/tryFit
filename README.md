# Virtual Try-On Flutter Application

This Flutter application allows users to virtually try on clothes. It leverages the API from [Models Lab Fashion API](https://modelslab.com/fashion-api) to provide this functionality. 

## Features

- Upload upper body and lower body images
- Specify height and width dimensions for the try-on
- Fetch and display the generated try-on image
- Retry fetching image in case of errors

## Requirements

- Flutter SDK
- Firebase (for image uploads)
- API Key from [Models Lab Fashion API](https://modelslab.com/fashion-api)

## Getting Started

### 1. Clone the repository

```sh
git clone https://github.com/yourusername/virtual-try-on.git
cd virtual-try-on
```
##2. Install dependencies
sh
Copy code
flutter pub get
##3. Set up Firebase
Create a new Firebase project in the Firebase Console.
Add an Android and/or iOS app to your Firebase project.
Download the google-services.json (for Android) and/or GoogleService-Info.plist (for iOS) and place them in the respective directories:
```sh
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
```
Follow the instructions to add Firebase to your Flutter app as described in the FlutterFire documentation.
##4. Configure the API Key
You need to purchase an API key from Models Lab Fashion API and configure it in your project.

##5. Run the application
```sh

flutter run
```
## Usage
Upload images for the upper body and lower body.
Specify the height and width for the try-on.
Click on the button to fetch the try-on image.
If an error occurs, you can retry fetching the image.
File Structure
```sh
lib/core/constants/: Contains constant values used across the application.
lib/services/: Contains the API service for interacting with the Models Lab Fashion API.
lib/controllers/: Contains the GetX controllers for state management.
lib/screens/: Contains the UI screens of the application.
```
##Contributing
If you find any issues or have suggestions for improvements, feel free to commit or open an issue. Contributions are welcome!

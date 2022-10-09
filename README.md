# Base_GetX

A new Base GetX Flutter project.

## Base UI
- Flash Screen.
- Logo App.
- SignIn Screen.
- SignUp Screen.
- Otp Screen.
- Profile Screen.

## Base Function
- Change theme.
- Change language(vi-en).
- Image Picker.
- Date Picker.

## Structure root
- ```android```: In this directory, all the project files for the android application. You can make changes, add necessary permissions and native Android code here.
- ```ios```: In this directory, all the project files for the ios application. You can make changes, add necessary permissions and native IOS code here.
- ```assets```: This folder contains all the files of the application. Ex: .png, .pdf v.v.
- ```build```: This folder contains all the compiled outputs like app bundles, apk files and other related files and folders.
- ```lib```: The directory containing the main source code of the app.
- ```pubspec.yaml, pubspec.lock```: These files contain all required package names, their versions, links to assets, dependencies, application name, application version, application dependencies, v.v.

## Structure project
- ```const```
    - ```theme```: Configs theme and styles.
    - ```app_configs```: Variable configs app.
    - ```import_const```: Export heavily used libraries.
    - ```status_code```: Status code when call api.
- ```lang```: The directory contains language files.
    - ```en_us```: File English.
    - ```vi_vn```: File Vietnamese.
    - ```lang_controller```: Handle change language.
    - ```translation_service```: List the languages used.
- ```models```: Model common.
- ```pages```: The directory contains screen of project.
    - Subpage structure
           - ```const```: Config use only in page.
           - ```models```: Contain all model of page.
           - ```widgets```: Widget of page.
           - ```services```: Handle call api.
           - ```page_controller.dart```: File handle logic page.
           - ```page_view.dart```: File view of page.
           - ```page_bindings.dart```: File binding of page.
- ```routes```: Init router, navigator page.
- ```services```: Init services api, firebase, setting...
- ```utils```: File common for app.
- ```widgets```: Widget common for page.
- ```my_app.dart```: Config app.
- ```main.dart```: File start application.

## Preview
<div>
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/c9ba0b5e551d9f43c60c.jpg?alt=media&token=25b657c4-46d1-41c0-a733-c23c68d25b8b" width="270" height="600" />
  <img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/signin.jpg?alt=media&token=379ab3af-2bc7-49fb-9214-e2db9aed91d3" width="270" height="600" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/signup.jpg?alt=media&token=d9f0dfee-e163-4b4b-a810-e0a6c37391ed" width="270" height="600" />
</div>
<div>
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/otp.jpg?alt=media&token=61758927-0803-452b-9274-72cc26a70fb6" width="270" height="600" />
  <img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/b655568301c0cb9e92d1.jpg?alt=media&token=54be98f0-fcfe-41f7-91b0-0480817838a2" width="270" height="600" />
  <img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/lang.jpg?alt=media&token=021f8e03-0eeb-473d-a7ce-8598e95a13fa" width="270" height="600" />
</div>
<div>
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/profile.jpg?alt=media&token=0878ab72-dd39-4947-977f-e2751049a3de" width="270" height="600" />
  <img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/date_picker.jpg?alt=media&token=69670cdf-a2e5-402c-9e11-667481c1531d" width="270" height="600" />
  <img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/img_picker.jpg?alt=media&token=b4dde82b-5df3-46b3-a3fb-c7510fa7ae89" width="270" height="600" />
</div>

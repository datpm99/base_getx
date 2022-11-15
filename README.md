# Base_GetX

A new Base GetX Flutter project.

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
<p align="left" width="100%">
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/1_splash_screen.png?alt=media&token=e4e16d74-39f3-4008-855e-269c499553fe" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/2_login_screen.png?alt=media&token=395e8ee2-5ad0-4dcb-b138-c07f19510480" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/3_sign_up_screen.png?alt=media&token=9a24ec70-8639-40cb-9720-35af262580ee" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/7_setting_screen.png?alt=media&token=af28556a-41d5-45ed-8cb4-5e2304545607" width="200" height="432" />
</p>

## WalkThrough
<p align="left" width="100%">
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/8_wt1.png?alt=media&token=1666d98f-f7ba-408f-a782-0e779385c345" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/9_wt2.png?alt=media&token=2675f4e7-aa3d-466e-b8d6-4a83aebe3ad6" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/10_wt2.png?alt=media&token=a4314d77-1cf6-4b21-90c7-411c79b80aa7" width="200" height="432" />
</p>
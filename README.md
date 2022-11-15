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
<div>
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/1_splash_screen.png?alt=media&token=e4e16d74-39f3-4008-855e-269c499553fe" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/2_login_screen.png?alt=media&token=395e8ee2-5ad0-4dcb-b138-c07f19510480" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/3_sign_up_screen.png?alt=media&token=9a24ec70-8639-40cb-9720-35af262580ee" width="270" height="600" />
</div>

### Home

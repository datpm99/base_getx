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
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/11_wt.png?alt=media&token=f51e6139-1a68-40ca-93de-b07207175947" width="200" height="432"/>
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/8_wt1.png?alt=media&token=1666d98f-f7ba-408f-a782-0e779385c345" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/9_wt2.png?alt=media&token=2675f4e7-aa3d-466e-b8d6-4a83aebe3ad6" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/10_wt2.png?alt=media&token=a4314d77-1cf6-4b21-90c7-411c79b80aa7" width="200" height="432" />
</p>

## BottomSheet
<p align="left" width="100%">
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/12_bsheet1.png?alt=media&token=b750a2b8-7daf-4f0a-93c5-6fa362cfdd65" width="200" height="432"/>
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/13_bsheet2.png?alt=media&token=7aadced3-a3a9-4df3-a5cc-6134902f7bda" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/14_bsheet3.png?alt=media&token=c0b3cfe4-50d1-4539-bd46-b23fd5415420" width="200" height="432" />
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/15_bsheet4.png?alt=media&token=4b10cf53-c86b-4e81-ae51-94c5d548a439" width="200" height="432" />
</p>

## Drawer
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/16_drawer.png?alt=media&token=f015e948-aa42-4864-bc73-f510b2a3bfa4" width="200" height="432"/>

```dart
ClipPath(
clipper: OvalRightBorderClipper(),
clipBehavior: Clip.antiAliasWithSaveLayer,
child: Drawer(),
)

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
```

## CheckBox
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/17_cb.png?alt=media&token=c6c18902-11f0-4a34-92ef-6c786fd85692" width="200" height="432"/>

```dart
Container(
  width: 25,
  height: 25,
  decoration: BoxDecoration(
  color: (controller.cusCb1.value)
            ? Styles.primaryColor
            : Colors.transparent,
  border: Border.all(width: 1, color: Styles.black2),
  borderRadius: BorderRadius.circular(5),
  ),
    child: Theme(
      data: ThemeData(unselectedWidgetColor: Colors.transparent),
       child: Checkbox(
         value: controller.cusCb1.value,
         onChanged: controller.onChangedCusCb1,
         activeColor: Colors.transparent,
         checkColor: Colors.white,
         materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
    ),
),
```

## Chip
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/18_chip.png?alt=media&token=5f68f4ef-69b3-459f-b439-106520bed6c8" width="200" height="432"/>

```dart
FilterChip(
  label: Text('Item $index'),
  labelStyle: Styles.normalText(color: Colors.white),
  shape: const StadiumBorder(side: BorderSide(width: 0.5)),
  selected: (controller.filterChip.value == index),
  selectedColor: Styles.primaryColor,
  checkmarkColor: Colors.white,
  onSelected: (val) => controller.onChangedFilterChip(index),
)













```

## ColorFiltered
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/19_color_filtered.png?alt=media&token=03a03bd7-16bd-4118-b88d-c18bfcb93411" width="200" height="432"/>

```dart
ColorFiltered(
  colorFilter: const ColorFilter.mode(
    Colors.grey,
    BlendMode.saturation,
  ),
  child: Image.asset('assets/images/avatar1.jpeg'),
),

ColorFiltered(
  colorFilter: const ColorFilter.mode(
    Colors.grey,
    BlendMode.multiply,
  ),
  child: Image.asset('assets/images/avatar1.jpeg'),
),




```
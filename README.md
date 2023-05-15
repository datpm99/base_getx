# Base_GetX
This is a sample project based on GetX.

## Feature
* Change theme.
* Internationalization.
* Handle call API (base on Dio).

## Requirement
* Flutter Version: 2.10.5.
* Dart SDK: 2.16.2.
* IDE: Android Studio or Visual Code.

#### Knowledge
* Dart programming language.
* GetX, get_storage.
* Dio, interceptors.

## Getting Started
* Run "Pub get" in Terminal or in file pubspec.yaml.

```shell script
cd <base-getx>
flutter pub get
```

## Project Structure
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/78.png?alt=media&token=9fe34e5e-2a94-4acc-b751-9f67185b16f3"/>

- ```const```: Includes app configuration such as Theme, Role,... .<br>
- ```lang```: Includes file languages.<br>
- ```models```: Includes model common.<br>
- ```pages```: Includes screen common such as Login, changePassword,... .<br>
- ```routes```: Routes management.<br>
- ```services```: Includes services such as API, Firebase, Storage.<br>
- ```utils```: Includes utilities such as Validation, Formatter,... .<br>
- ```widgets```: Includes widgets common.<br>

## Page Structure
- ```pages```: The directory contains screen of project.
    - Subpage structure
        - ```const```: Config use only in page.
        - ```models```: Contain all model of page.
        - ```widgets```: Widget of page.
        - ```services```: Handle call api.
        - ```page_controller.dart```: File handle logic page.
        - ```page_view.dart```: File view of page.
        - ```page_bindings.dart```: File binding of page.

## Usage
### Internationalization
This project supports two languages: English and Vietnamese.
* First, Add a language key.

`lib/lang/vi_vn.dart`

```arb
{
  'login': 'Đăng nhập',
}
```

`lib/lang/en_us.dart`

```arb
{
  'login': 'Login',
}
```

* Second, Use a language key.

```dart
Text('login'.tr),
```

* Third, Change language.

```dart
final lang = Get.find<LangController>();
lang.changeLang('vi', 'VN');
lang.changeLang('en', 'US');
```

### Theme
Directory `lib/const/theme`. Includes configuration about Color, TextStyle, BoxShadow, BoxDecoration.
* First, Color.

```dart
// Add a color.
// Directory lib/const/theme/styles.
static const white19 = Color(0xffF5F8FB);

// Use a color.
Text('login'.tr, style: Styles.normalText(color: Styles.white19)),
```

* Second, TextStyle.
  TextStyle defined in path `lib/const/theme/styles.dart` is not corrected.

```dart
// Use a TextStyle.
Text('login'.tr, style: Styles.normalText()),
```

* Third, BoxShadow.

```dart
// Use a BoxShadow.
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: Styles.boxShadow1(),
  ),
  child: Image.asset('assets/icons/ic_advance_ticket.png', width: 24),
),
```

* Fourth, BoxDecoration.

```dart
// Use a BoxDecoration.
Container(
  decoration: Styles.boxDecoration1(),
  child: Image.asset('assets/icons/ic_advance_ticket.png', width: 24),
),
```

### Logger
Small, easy to use and extensible logger which prints beautiful logs.

<img src="https://raw.githubusercontent.com/Bungeefan/logger/master/art/screenshot.png"/>

```dart
///Logger.
static void showLogInfo(String msg) {
  loggerNoStack.i(msg);
}

static void showLogWarning(String msg) {
  loggerNoStack.w(msg);
}

static void showLogError(String msg) {
  logger.e(msg);
}

///Usage.
AppUtils.showLogInfo('This is info log');
AppUtils.showLogWarning('This is warning log');
AppUtils.showLogError('This is error log');

///Note.
//loggerNoStack : number of method calls to be displayed equal 0.
//logger: number of method calls to be displayed equal 2.
```

### Data state
This project uses GetX for state management. In Controller layer, use GetxController.

There are two ways to update the status. Use variables `Rx` or Function `update();`

* First way: Use variables `Rx`

```dart
// Class controller.
import 'package:get/get.dart';

class CounterController extends GetxController {
  Rx<int> count = 0.obs;

  void increment() {
    count.value++;
  }
}
```

```dart
// Class view.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Text('${controller.count.value}');
      }),
    );
  }
}
```

* Second way: Use Function `update();`
  In case there are many places, it is necessary to update the status using ID.

```dart
// Class controller.
import 'package:get/get.dart';

class CounterController extends GetxController {
  int count = 0;

  void increment() {
    count++;
    update([1]); //Only update widget with id equal to 1.
  }
}
```

```dart
// Class view.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CounterController>(
        id: 1,
        builder: (c) {
          return Text('${c.count}');
        },
      ),
    );
  }
}
```

Read more [Getx state management](https://pub.dev/packages/get#state-management)

### Route
This project uses GetX for route management. Defined in path `lib/routes/routes.dart`

```dart
import 'package:get/get.dart';
import '/pages/page.dart';

abstract class Routes {
  static const login = '/login';
  static const loginOutSide = '/login_outside';
  static const changePassword = '/change_password';
}

abstract class AppPages {
  static String initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
```
#### Navigation with named routes

Navigate to a new screen with name.
```dart
Get.toNamed(Routes.login);
```

To navigate and remove the previous screen from the tree.
```dart
Get.offNamed(Routes.login);
```

To navigate and remove all previous screens from the tree.
```dart
Get.offAllNamed(Routes.login);
```

To close anything you would normally close with Navigator.pop(context).
```dart
Get.back();
```

On other screen, send a data for previous route:
```dart
Get.back(result: 'success');
```

#### Send data to named Routes

Just send what you want for arguments. Get accepts anything here, whether it is a String, a Map, a List, or even a class instance.
```dart
Get.toNamed(Routes.login, arguments: 'Get is the best');
```

on your class or controller:

```dart
print(Get.arguments);
//print out: Get is the best
```

Read more [Getx route management](https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md)

### Utilities
Directory `lib/utils`. Includes utilities such as: Validation, Formatter, Downloader, Uploader.

#### AppNative
Including device operations such as: deviceInfo, makePhoneCall, sendSms, sendEmail,... .

How to use.

```dart
AppNative.sendSms('This is a new message'),
```

#### AppValidation
Includes input authentication methods such as: email, password,... .

How to use.

```dart
AppValidation.email('datpm@bssd.com'),
```

#### DateFormatter
Includes methods `datePicker` and `dateFormat`.

How to use.

```dart
DateFormatter.formatDate5('20/09/1999'),
```

```dart
DateTime? datePicker = await DateFormatter.datePicker(
  context,
  initDate: initDate,
  errorFormatText: 'msg_error_format_date'.tr,
);
```

#### TimeFormatter
Includes methods `timePicker` and `timeFormat`.

How to use.

```dart
TimeOfDay time = TimeOfDay.now();
var result = await TimeFormatter.timePicker(context, time);
```

#### SingletonRole
Check user permissions. The user will not be able to use the functions without permission.

How to use.

```dart
// Return boolean.
SingletonRole().taskCreate()
```

#### AppUtils
Definition of utility methods is used a lot.

How to use.

```dart
// Show dialog loading.
AppUtils.showLoader();

// Hide dialog loading.
AppUtils.hideLoader();

// Show message error with snack bar.
AppUtils.showError('This is an error message');

// Show message success with snack bar.
AppUtils.showSuccess('This is an success message');

// Get platForm.
AppUtils.getPlatForm();

// Logout.
AppUtils.logout();
```

### Handle call API (base on Dio)
Here is a sequence diagram of action get data from API.
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/dio.png?alt=media&token=56785e54-af06-461a-b72b-d033f9543803"/>

As usual, we can change domain, setting when before api in `lib/services/api/base_api.dart`.
```dart
// const domainPublic = 'https://service.mdo.com.vn/api/';
const domainTest = 'https://service-mass.mdo.com.vn/api/';
// const domainTest = 'https://test.mdo.com.vn/api/';
// const domainTest = 'https://staging.mdo.com.vn/api/';
```

How to use.
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/dio1.png?alt=media&token=00da69ed-75ea-4db5-beaa-098c945ff8cd" />

* First, Create a model map data response from api ([quicktype.io](https://app.quicktype.io/)).
```dart
class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    this.data,
  });

  int status;
  String message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"] ?? 0,
    message: json.containsKey("message") ? json["message"] : '',
    data: (json["data"] == null) ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    required this.token,
    required this.tokenTimeout,
    required this.captcha,
    required this.refreshToken,
    required this.refreshTokenExpiredAt,
  });

  String token;
  int tokenTimeout;
  String captcha;
  String refreshToken;
  int refreshTokenExpiredAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json.containsKey("token") ? json["token"] : '',
    tokenTimeout: json["tokenTimeout"] ?? 0,
    captcha: json.containsKey("captcha") ? json["captcha"] : '',
    refreshToken: json["refreshToken"] ?? '',
    refreshTokenExpiredAt: json["refreshTokenExpiredAt"] ?? 0,
  );
}
```

* Second, Create function call api login in `login_service.dart`.
```dart
Future<LoginModel?> login(String request) async {
  try {
    var response = await _service.postRequest(
      url: CommonApi.login,
      data: request,
    );
    if (response != null) {
      return LoginModel.fromJson(response.data);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}
```

* Third, Create function handle logic with UI in `login_controller.dart`.
```dart
Future<void> login() async {
  AppUtils.showLoader();
  LoginRequest request = LoginRequest(
    username: _fields.email.value.trim(),
    password: _fields.password.value,
    guid: storage.deviceID,
    captcha: _fields.captcha.value.trim(),
  );
  var result = await loginService.login(request.toJson());
  await AppUtils.hideLoader();

  if (result != null && result.status == StatusCodes.ok) {
    Get.offAllNamed(Routes.root);
  } else if (result != null && result.message.isNotEmpty) {
    AppUtils.showError(result.message);
  } else {
    debugPrint('error ---> _login');
    AppUtils.showError('msg_have_error'.tr);
  }
}
```

* Note, with api need param data create model request `login_request.dart`.
```dart
class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
    required this.guid,
    required this.captcha,
  });

  String username;
  String password;
  String guid;
  String captcha;

  Map<String, dynamic> toMap() => {
    "username": username,
    "password": password,
    "guid": guid,
    "captcha": captcha,
  };

  String toJson() => json.encode(toMap());
}
```

### Handle different screens
<img src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/sizes-phone-tablet.png?alt=media&token=d9a1bf8d-c7fe-4688-b562-6ac1578bb28d"/>

* Add `with AdaptivePage` into Widget.
```dart
class LoginView extends StatelessWidget with AdaptivePage{
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: adaptiveBody(context),
    );
  }

  @override
  Widget mobileLandscapeBody(BuildContext context, Size size) {
    // TODO: implement mobileLandscapeBody
    throw UnimplementedError();
  }

  @override
  Widget mobilePortraitBody(BuildContext context, Size size) {
    // TODO: implement mobilePortraitBody
    throw UnimplementedError();
  }

  @override
  Widget tabletLandscapeBody(BuildContext context, Size size) {
    // TODO: implement tabletLandscapeBody
    throw UnimplementedError();
  }

  @override
  Widget tabletPortraitBody(BuildContext context, Size size) {
    // TODO: implement tabletPortraitBody
    throw UnimplementedError();
  }
}
```

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

## Cupertino Context Menu
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/20_cupertino.png?alt=media&token=bca3fa05-d5ae-4b16-a87e-e2d8f153bce7" width="200" height="432"/>

```dart
CupertinoContextMenu(
  child: Container(
    height: 190,
    width: Get.width,
    margin: const EdgeInsets.all(16.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset('assets/images/avatar1.jpeg', fit: BoxFit.cover),
    ),
  ),
  actions: <Widget>[
    CupertinoContextMenuAction(
      child: Text('Copy', style: Styles.normalText()),
      isDefaultAction: true,
      trailingIcon: Icons.content_copy,
      onPressed: () => Get.back(),
    ),
    CupertinoContextMenuAction(
      child: Text('Share', style: Styles.normalText()),
      trailingIcon: Icons.share,
      onPressed: () => Get.back(),
    ),
    CupertinoContextMenuAction(
      child: Text('Delete', style: Styles.normalText()),
      trailingIcon: Icons.delete,
      onPressed: () => Get.back(),
    ),
  ],
),

```

## Cupertino Sliding Segmented Control
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/21_cupertino.png?alt=media&token=220578a0-e49f-4d9c-abae-616d8b4413ef" width="200" height="432"/>

```dart
Column(
  children: [
    Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: CupertinoSlidingSegmentedControl(
        children: {
          0: Text(
            'Home',
            style: Styles.normalText(color: (c.sliding == 0) ? Colors.black : Colors.grey),
          ).p(8),
          1: Text(
            'Booking',
            style: Styles.normalText(color: (c.sliding == 1) ? Colors.black : Colors.grey),
          ).p(8),
          2: Text(
            'Setting',
            style: Styles.normalText(color: (c.sliding == 2) ? Colors.black : Colors.grey),
          ).p(8),
        },
        groupValue: c.sliding,
        onValueChanged: c.onValueChanged,
      ),
    ),
    if (c.sliding == 0) mPage("Home"),
    if (c.sliding == 1) mPage("Booking"),
    if (c.sliding == 2) mPage("Setting"),
  ],
)

```

## ShowCase View
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/demofirebase-5d7b7.appspot.com/o/22_showCase.png?alt=media&token=120fe957-08e0-4ea5-b12d-f4dcf1aaa957" width="200" height="432"/>

```dart
Showcase(
  key: controller.two,
  title: 'Profile',
  description: "Tap to see profile which contains user's name.",
  showcaseBackgroundColor: Colors.pinkAccent,
  textColor: Colors.white,
  shapeBorder: const CircleBorder(),
  child: Container(
    padding: const EdgeInsets.all(5),
    width: 45,
    height: 45,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.pinkAccent,
    ),
    child: const Icon(Icons.star),
  ),
),




```
import 'package:get/get.dart';
import 'tinder_card.dart';
import 'tinder_model.dart';

class TinderCardController extends GetxController {
  CardController controller = CardController();
  bool isRefresh = false;

  List<TinderModel> lstTinder = [
    TinderModel(
      name: 'Trang',
      image: 'assets/images/woman-1.jpeg',
      age: 19,
      city: 'HaNoi',
    ),
    TinderModel(
      name: 'Nhung',
      image: 'assets/images/woman-2.jpeg',
      age: 20,
      city: 'HCM',
    ),
    TinderModel(
      name: 'Ly',
      image: 'assets/images/woman-3.jpeg',
      age: 21,
      city: 'HaNoi',
    ),
  ];

  void onTriggerLeft() {
    controller.triggerLeft();
  }

  void onTriggerRight() {
    controller.triggerRight();
  }

  void onRefreshData() {
    isRefresh = !isRefresh;
    update();
  }
}

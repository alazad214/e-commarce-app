import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Product_Contoller extends GetxController {
  RxInt selectIndex = RxInt(0);
  RxString selectSize = RxString("");

  List sizes = [15, 20, 25, 30, 40];
}

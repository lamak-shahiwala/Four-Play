import 'package:four_play/controllers/game_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<GameController>(() => GameController());
  }
}
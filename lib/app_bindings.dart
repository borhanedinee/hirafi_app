import 'package:get/get.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/presentation/controller/locale_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocaleController>(
      () => LocaleController(),
      fenix: true,
    );

    Get.lazyPut<GlobalDataController>(
      () => GlobalDataController(),
      fenix: true,
    );
  }
}

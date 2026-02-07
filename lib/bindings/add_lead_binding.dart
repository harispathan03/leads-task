import 'package:get/get.dart';
import 'package:leads_task/controllers/add_lead_controller.dart';

class AddLeadBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddLeadController(),);
  }

}
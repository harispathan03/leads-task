import 'package:get/get.dart';
import 'package:leads_task/helper/leads_storage.dart';
import 'package:leads_task/model/lead.dart';

class LeadsController extends GetxController{
  RxList<Lead> leads = <Lead>[].obs;

  @override
  void onInit() {
    getLeads();
    super.onInit();
  }

  void getLeads(){
    leads.value = LeadsStorage().getLeads();
  }
}
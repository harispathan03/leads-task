import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:leads_task/helper/leads_storage.dart';
import 'package:leads_task/model/lead.dart';

class LeadsController extends GetxController{
  TextEditingController searchController = TextEditingController();
  RxString search = ''.obs;
  RxList<Lead> leads = <Lead>[].obs;
  RxList<Lead> mainleads = <Lead>[].obs;

  @override
  void onInit() {
    getLeads();
    super.onInit();
  }

  void getLeads(){
    if(mainleads.isEmpty){
      mainleads.value = LeadsStorage().getLeads();
    }
    leads.value = LeadsStorage().getLeads();
  }
}
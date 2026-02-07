import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leads_task/controllers/leads_controller.dart';
import 'package:leads_task/model/lead.dart';

import '../helper/leads_storage.dart';

class AddLeadController extends GetxController{
  RxBool isLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxString selectedService = 'Web Development'.obs;
  RxList<String> services = ['Web Development', 'App Development', 'UI/UX', 'Digital Marketing'].obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addLead() async {
    if(formKey.currentState?.validate()==false) return;
    isLoading.value = true;
    Lead lead = Lead(name: nameController.text, email: emailController.text, phone: phoneController.text, service: selectedService.value);
    await LeadsStorage().saveLead(lead);
    Get.back();
    Get.rawSnackbar(message: 'Lead saved successfully', backgroundColor: Colors.green);
    Get.find<LeadsController>().getLeads();
    isLoading.value = false;
  }
}
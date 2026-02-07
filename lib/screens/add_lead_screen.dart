import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leads_task/widget/common_dropdown.dart';
import 'package:leads_task/widget/common_textfield.dart';
import 'package:leads_task/widget/primary_button.dart';

import '../controllers/add_lead_controller.dart';
import '../utils/colors.dart';

class AddLeadScreen extends GetView<AddLeadController> {
  const AddLeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Add Lead", style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Obx(() => Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          children: [
            SizedBox(height: 16),
            CommonTextfield(
              controller: controller.nameController,
              label: "Name",
              textInputType: TextInputType.name,
              validator: (email) {
                if(email==null || email.isEmpty==true){
                  return "Please enter name";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CommonTextfield(
              controller: controller.emailController,
              label: "Email",
              textInputType: TextInputType.emailAddress,
              validator: (email) {
                if(email==null || email.isEmpty==true){
                  return "Please enter email";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CommonTextfield(
              controller: controller.phoneController,
              label: "Phone",
              textInputType: TextInputType.phone,
              validator: (email) {
                if(email==null || email.isEmpty==true){
                  return "Please enter phone number";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CommonDropdown(items: controller.services, title: "Service", onChanged: (value) {
              if(value==null) return;
              controller.selectedService.value = value;
            }, value: controller.selectedService.value, itemLabelBuilder: (p) => p),
            SizedBox(height: 16),
            controller.isLoading.value ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)) : PrimaryButton(text: 'Submit', onTap: () {
              controller.addLead();
            },)
          ],
        ),
      )),
    );
  }
}
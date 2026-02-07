import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:leads_task/model/lead.dart';

import '../controllers/leads_controller.dart';
import '../routes.dart';
import '../utils/colors.dart';

class LeadsScreen extends GetView<LeadsController> {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leads", style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Obx(() => controller.leads.isEmpty ? const Center(child: Text("No Leads Found", style: TextStyle(fontSize: 20),),) : Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: ListView.builder(itemCount: controller.leads.length, itemBuilder: (context, index) {
          Lead lead = controller.leads[index];
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonDetailRow(title: "Name", value: lead.name),
                SizedBox(height: 4,),
                CommonDetailRow(title: "Email", value: lead.email),
                SizedBox(height: 4,),
                CommonDetailRow(title: "Phone", value: lead.phone),
                SizedBox(height: 4,),
                CommonDetailRow(title: "Service", value: lead.service),
              ],
            ),
          );
        },)
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.toNamed(RouteName.addLead);
      }, backgroundColor: AppColors.primaryColor, child: const Icon(Icons.add, color: Colors.white,)));
  }
}

class CommonDetailRow extends StatelessWidget {
  final String title;
  final String value;
  const CommonDetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: TextStyle(fontSize: 16),)),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      ],
    );
  }
}
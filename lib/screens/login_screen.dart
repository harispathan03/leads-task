import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leads_task/utils/colors.dart';
import 'package:leads_task/widget/common_textfield.dart';
import 'package:leads_task/widget/primary_button.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          children: [
            SizedBox(height: 16),
            CommonTextfield(
              controller: controller.emailController,
              label: "Email",
              textInputType: TextInputType.emailAddress,
              validator: (email) {
                if(email==null || email.isEmpty==true){
                  return "Please enter an email";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CommonTextfield(
              controller: controller.passwordController,
              label: "Password",
              validator: (password) {
                if(password==null || password.isEmpty==true){
                  return "Please enter password";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            PrimaryButton(text: "Submit", onTap: () {
              controller.onLogin();
            },)
          ],
        ),
      ),
    );
  }
}
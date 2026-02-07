import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leads_task/helper/local_storage_helper.dart';
import 'package:leads_task/routes.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> onLogin() async {
    if(formKey.currentState?.validate()==true){
      if(emailController.text=='admin@leads.com' && passwordController.text=='123456'){
        await LocalStorage.write(key: LocalStorageKeys.isLoggedIn, data: true);
        Get.offAllNamed(RouteName.leads);
      }else{
        Get.rawSnackbar(message: "Invalid Credentials", backgroundColor: Colors.red,);
      }
    }
  }
}
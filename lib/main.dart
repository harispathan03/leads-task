import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:leads_task/helper/local_storage_helper.dart';
import 'package:leads_task/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      bool isLoggedIn = await LocalStorage.read(key: LocalStorageKeys.isLoggedIn) ?? false;
      if(isLoggedIn){
        Get.offAllNamed(RouteName.leads);
      }else{
        Get.offAllNamed(RouteName.login);
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Leads Task',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RouteName.login,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutesPages,
    );
  }
}
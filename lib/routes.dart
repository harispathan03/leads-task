import 'package:get/get.dart';
import 'package:leads_task/bindings/add_lead_binding.dart';
import 'package:leads_task/bindings/leads_binding.dart';
import 'package:leads_task/screens/add_lead_screen.dart';
import 'package:leads_task/screens/leads_screen.dart';
import 'package:leads_task/screens/login_screen.dart';

import 'bindings/login_binding.dart';

abstract class _AppRouteName {
  static const String login = '/login';
  static const String leads = '/leads';
  static const String addLead = '/addLead';
}

class RouteName {
  static const String login = _AppRouteName.login;
  static const String leads = _AppRouteName.leads;
  static const String addLead = _AppRouteName.addLead;
}

class AppRoutes {
  static List<GetPage<dynamic>> appRoutesPages = [
    GetPage(
        name: _AppRouteName.login,
        page: () => LoginScreen(),
        binding: LoginBinding(),
        transitionDuration: const Duration(milliseconds: 800),
        maintainState: true,
        ),
    GetPage(
        name: _AppRouteName.leads,
        page: () => LeadsScreen(),
        binding: LeadsBinding(),
        transitionDuration: const Duration(milliseconds: 800),
        maintainState: true,
        ),
    GetPage(
        name: _AppRouteName.addLead,
        page: () => AddLeadScreen(),
        binding: AddLeadBinding(),
        transitionDuration: const Duration(milliseconds: 800),
        maintainState: true,
        ),
  ];
}

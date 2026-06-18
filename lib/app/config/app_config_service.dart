import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/models/splash_model.dart';

class AppConfigService extends GetxService {
  // Service load hole data instantiate hobe
  late final AppInfoModel appData;

  Future<AppConfigService> init() async {
    // Ekhane real API call thakle amra await response nitam.
    // Ekhon amra 1 second real delay load ashar fake simulation korbo.
    await Future.delayed(const Duration(seconds: 1));

    appData = AppInfoModel(
      title: 'ESS Portal',
      subtitle: 'Smart Employee Workplace',
      version: 'Powered by HRMS v3.0',
    );

    return this;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:new_system_flutter/app/config/api_service.dart';
import 'package:new_system_flutter/app/dashboard/models/hospital.dart';

class HospitalConroller extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;

  var users = <Hospital>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;

      final response = await apiService.getHospital();

      final data = response.data;

      final List records = data['SampleData']; // 🔥 FIX HERE

      users.value = records.map((e) => Hospital.fromJson(e)).toList();
      // ignore: invalid_use_of_protected_member
      debugPrint(users.value.toString());
    } catch (e) {
      Get.snackbar("Error Arafat", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

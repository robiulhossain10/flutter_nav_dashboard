import 'package:get/get.dart';
import 'package:new_system_flutter/app/config/api_service.dart';
import 'package:new_system_flutter/app/dashboard/models/user_photos.dart';

class UserController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;

  var users = <UserPhotos>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;

      final response = await apiService.getATT();

      final data = response.data;

      final List records = data['records']; // 🔥 FIX HERE

      users.value = records.map((e) => UserPhotos.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';
import 'package:new_system_flutter/app/utils/app_dialog.dart';
import 'package:new_system_flutter/app/utils/app_snacbar.dart';

// ignore: must_be_immutable
class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: ((didPop, result) => {}),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Menu",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.amberAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                AppDialog.show(
                  type: DialogType.delete,
                  title: 'Delete Employee',
                  message: 'Are you sure you want to delete this employee?',
                  onConfirm: () {
                    print('Employee Deleted');
                  },
                );
              },
              icon: const Icon(Icons.sunny),
            ),
            IconButton(
              onPressed: () {
                AppSnackbar.show(
                  title: 'Arafat',
                  message: 'KANIS',
                  type: SnackbarType.success,
                );
              },
              icon: const Icon(Icons.camera_alt, color: Colors.teal),
              hoverColor: Colors.amber,
              splashRadius: 20,
              splashColor: Colors.lightGreen,
            ),
            IconButton(
              onPressed: () {
                AppDialog.show(
                  type: DialogType.warning,
                  title: 'Warning',
                  message: 'Are you sure Procceed?',
                  onConfirm: () {
                    print('Employee Deleted');
                  },
                );
              },
              icon: const Icon(Icons.mic_external_on, color: Colors.indigoAccent),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              AppSnackbar.show(
                title: 'Success',
                message: 'Employee Added',
                type: SnackbarType.info,
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        backgroundColor: Colors.teal,
        body: Center(
          child: Container(
            height: 200,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [const BoxShadow(blurRadius: 10, offset: Offset(0, 3))],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(blurRadius: 10, offset: Offset(0, 5)),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amberAccent,
                    ),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.details);
                            },
                            icon: const Icon(
                              Icons.add_location_alt_sharp,
                              size: 50,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.profile);
                            },
                            icon: const Icon(
                              Icons.verified,
                              size: 50,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.users);
                            },
                            icon: const Icon(
                              Icons.whatshot,
                              size: 50,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

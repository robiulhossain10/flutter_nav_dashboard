import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

class ProfilreView extends StatelessWidget {
  const ProfilreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: Card(
        color: Colors.lightBlue,
        child: Container(
          height: 300,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () => {
                          Get.toNamed(AppRoutes.details)
                        },
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.deepPurple,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

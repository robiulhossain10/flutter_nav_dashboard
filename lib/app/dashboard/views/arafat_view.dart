import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

class ArafatView extends StatelessWidget {
  const ArafatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Arafat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                      ),
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Arafat',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Flutter Developer',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text('Dhaka Bangladesh'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(15),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.cyanAccent,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Arafat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.link, color: Colors.blueGrey),
                              SizedBox(width: 6),
                              Text('Flutter Developer'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.maps_home_work_rounded,
                                color: Colors.red,
                                size: 16,
                              ),
                              SizedBox(width: 12),
                              Text('Dhaka Bangladesh'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 8,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),

                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Arafat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.code, size: 16, color: Colors.indigo),
                              SizedBox(width: 5),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text('Dhaka, Bangladesh'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 8,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),

                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Arafat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.code, size: 16, color: Colors.indigo),
                              SizedBox(width: 5),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text('Dhaka, Bangladesh'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 8,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),

                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Arafat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.code, size: 16, color: Colors.indigo),
                              SizedBox(width: 5),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text('Dhaka, Bangladesh'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 8,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),

                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Arafat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.code, size: 16, color: Colors.indigo),
                              SizedBox(width: 5),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text('Dhaka, Bangladesh'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 8,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),

                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Arafat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.code, size: 16, color: Colors.indigo),
                              SizedBox(width: 5),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text('Dhaka, Bangladesh'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 8,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),

                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Arafat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.code, size: 16, color: Colors.indigo),
                              SizedBox(width: 5),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text('Dhaka, Bangladesh'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 8,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/848JYZCy/1779782652825-P-P-jpg.jpg',
                          ),
                        ),

                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Arafat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: const [
                              Icon(Icons.code, size: 16, color: Colors.indigo),
                              SizedBox(width: 5),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text('Dhaka, Bangladesh'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.home);
                      },
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

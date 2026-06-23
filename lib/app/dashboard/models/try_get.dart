import 'package:flutter/material.dart';

class RobiulPage extends StatelessWidget {
  const RobiulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RobiulPage', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: true,
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [const BoxShadow(color: Colors.green)],
                      ),
                      height: 50,
                      width: 50,
                      child: const Icon(Icons.verified, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [const BoxShadow(color: Colors.green)],
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.verified, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [const BoxShadow(color: Colors.green)],
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.verified, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

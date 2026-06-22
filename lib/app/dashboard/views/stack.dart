import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

class StackView extends StatelessWidget {
  const StackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Practice'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.lightGreenAccent)],
              ),
              child: Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  'Robiul Hossain',
                  style: GoogleFonts.bebasNeue(fontSize: 35),
                ),
              ),
            ),

            const Positioned(
              right: 165,
              bottom: 180,

              child: FaIcon(
                FontAwesomeIcons.googlePay,
                color: Colors.redAccent,
                size: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ১. সাধারণ চিকন বর্ডার আইকন (Default Thin Outlined)
                const Icon(
                  Symbols.verified,
                  color: Colors.blue,
                  size: 40,
                  weight: 600,
                  opticalSize: 34,
                ),

                const Icon(Icons.verified, size: 40, color: Colors.red),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Symbols.home, size: 40),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Symbols.menu, size: 30, color: Color(0xFFF70000)),
                ),

                // ২. FULL FILL FEATURE: আইকনের ভেতরটা সম্পূর্ণ ভরাট হবে
                const Icon(Symbols.face, size: 40, color: Colors.red),

                // ৩. CUSTOM WEIGHT FEATURE: আইকনের দাগগুলো চরম মোটা (Bold) হবে
                const Icon(Symbols.home, size: 40),

                // ৪. ALL FEATURES COMBINED: সব ফিচার একসাথে ব্যবহার
                const Icon(Symbols.verified, size: 50, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewPracticeView extends StatelessWidget {
  const NewPracticeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ১. টেক্সট এবং টাইটেল কনফিগারেশন
        title: const Text(
          'Advanced App Bar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true, // টাইটেল মাঝখানে রাখার জন্য
        titleSpacing: NavigationToolbar
            .kMiddleSpacing, // টাইটেলের চারপাশের ডিফল্ট স্পেসিং কাস্টমাইজ করা
        // ২. কালার ও থিমিং
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white, // টাইটেল ও আইকনের গ্লোবাল কালার সেট করে
        shadowColor: Colors.black54, // স্ক্রোল করলে যে শ্যাডো পড়বে তার কালার
        surfaceTintColor:
            Colors.purpleAccent, // উপাদানগুলোর উপর হালকা আভা ফেলার জন্য
        // ৩. সাইজ, এলিভেশন ও শেপ
        elevation: 8.0, // মেটেরিয়াল শ্যাডো ইফেক্ট
        scrolledUnderElevation:
            12.0, // কন্টেন্ট স্ক্রোল করে নিচে গেলে এলিভেশন কেমন হবে
        toolbarHeight:
            90.0, // অ্যাপবারের মূল অংশের হাইট (ডিফল্ট ৫৬ থেকে বাড়িয়ে ৭০ করা হয়েছে)
        toolbarOpacity: 1.0, // অ্যাপবারের ভেতরের কন্টেন্টের অপাসিটি
        bottomOpacity: 0.9, // বটম উইজেটের (যেমন ট্যাব বার) অপাসিটি
        // ৪. শেপ (রাউন্ডেড কর্নার ডিজাইন)
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        ),

        // ৫. লিডিং উইজেট (বামে সাধারণত ব্যাক বা মেনু বাটন থাকে)
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          tooltip: 'Open Menu',
          onPressed: () {
            // মেনু ওপেন করার লজিক
          },
        ),
        leadingWidth: 56.0, // লিডিং উইজেটের জন্য কতটুকু জায়গা বরাদ্দ থাকবে
        automaticallyImplyLeading:
            true, // ব্যাক বাটন বা ড্রয়ার থাকলে অটোমেটিক্যালি লিডিং আইকন দেখাবে কিনা
        // 🔴 ৬. অ্যাকশনস উইজেট (ডানপাশের বাটন বা মেনু সমূহ)
        actions: [
          // সার্চ বাটন
          IconButton(
            icon: const Icon(Icons.search_rounded),
            tooltip: 'Search',
            onPressed: () {},
          ),

          // নোটিফিকেশন বাটন ব্যাজ সহ
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                ),
              ),
            ],
          ),

          // কাস্টম পপআপ মেনু বাটন (থ্রি-ডট মেনু)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded),
            onSelected: (value) {
              // মেনু সিলেক্টের লজিক
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(value: 'settings', child: Text('Settings')),
                const PopupMenuItem(
                  value: 'profile',
                  child: Text('My Profile'),
                ),
                const PopupMenuItem(value: 'logout', child: Text('Logout')),
              ];
            },
          ),
        ],

        // 🔴 ৭. ফ্লেক্সিবল স্পেস (ব্যাকগ্রাউন্ডে গ্রেডিয়েন্ট বা ইমেজ দেওয়ার জন্য)
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // 🔴 ৮. বটম উইজেট (অ্যাপবারের নিচে সাধারণত TabBar বা সার্চবার থাকে)
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
            60.0,
          ), // বটম উইজেটের জন্য উচ্চতা নির্ধারণ
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0, left: 16, right: 16),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const TextField(
                readOnly:
                    true, // জাস্ট ডিজাইন পারপাস, ক্লিক করলে সার্চ পেজে নিয়ে যাবে
                decoration: InputDecoration(
                  hintText: 'Search inside stack practices...',
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
        ),

        // ৯. অন্যান্য সিস্টেম অপটিমাইজেশন সেটিংস
        primary:
            false, // অ্যাপবারটি ওএসের স্ট্যাটাসবারের নিচ থেকে শুরু হবে কিনা
        excludeHeaderSemantics:
            false, // স্ক্রিন রিডার বা এক্সেসিবিলিটির জন্য গুরুত্বপূর্ণ
        clipBehavior: Clip
            .antiAlias, // রাউন্ডেড শেপ নিখুঁতভাবে কাটার জন্য অ্যান্টি-অ্যালিয়াসিং
      ),
      body: Stack(
        children: [
          
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ApprovalView extends StatefulWidget {
  const ApprovalView({super.key});

  @override
  State<ApprovalView> createState() => _ApprovalViewState();
}

class _ApprovalViewState extends State<ApprovalView> {
  final List<Map<String, dynamic>> requests = [
    {
      "id": 1,
      "name": "Robiul Islam",
      "type": "Leave Request",
      "date": "19 Jun 2026",
    },
    {
      "id": 2,
      "name": "Rakib Hasan",
      "type": "Attendance Correction",
      "date": "18 Jun 2026",
    },
    {
      "id": 3,
      "name": "Nayeem Ahmed",
      "type": "Expense Claim",
      "date": "17 Jun 2026",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pending Approvals")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final item = requests[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Slidable(
              key: ValueKey(item["id"]),

              /// APPROVE
              startActionPane: ActionPane(
                motion: const StretchMotion(),

                dismissible: DismissiblePane(
                  onDismissed: () {
                    _approve(index);
                  },
                ),

                children: [
                  SlidableAction(
                    onPressed: (_) => _approve(index),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.check_circle,
                    label: 'Approve',
                  ),
                ],
              ),

              /// HOLD + REJECT
              endActionPane: ActionPane(
                motion: const DrawerMotion(),

                dismissible: DismissiblePane(
                  onDismissed: () {
                    _reject(index);
                  },
                ),

                children: [
                  SlidableAction(
                    onPressed: (_) => _hold(index),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    icon: Icons.pause,
                    label: 'Hold',
                  ),
                  SlidableAction(
                    onPressed: (_) => _reject(index),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.close,
                    label: 'Reject',
                  ),
                ],
              ),

              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.person),
                  ),
                  title: Text(
                    item["name"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${item["type"]}\n${item["date"]}"),
                  isThreeLine: true,
                  trailing: const Icon(Icons.swipe_left_alt),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _approve(int index) {
    final employee = requests[index]["name"];

    setState(() {
      requests.removeAt(index);
    });

    _showSnackBar("✅ $employee Approved");
  }

  void _hold(int index) {
    final employee = requests[index]["name"];

    _showSnackBar("⏸️ $employee Put On Hold");
  }

  void _reject(int index) {
    final employee = requests[index]["name"];

    setState(() {
      requests.removeAt(index);
    });

    _showSnackBar("❌ $employee Rejected");
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}

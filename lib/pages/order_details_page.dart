import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void callServerOnPressed() {}

    void cancelButtonOnPressed() => Navigator.pop(context);

    void okButtonOnPressed() {
      Navigator.pop(context);
    }

    void leaveTableOnPressed() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are you sure to leave table'),
            content: Text('Data'),
            actions: [
              TextButton(
                onPressed: cancelButtonOnPressed,
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: okButtonOnPressed,
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Order Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: callServerOnPressed,
              child: Text('Call a server'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: leaveTableOnPressed,
              child: Text('Leave a table'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void bookButtonOnPressed() {
      Navigator.pushReplacementNamed(context, 'order-details-page');
    }

    final tablesList = List.generate(6, (index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          3,
          (index) => TableWidget(bookOnPressed: bookButtonOnPressed),
        ),
      );
    }).toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 4,
        title: Text('Cafe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: tablesList,
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  final VoidCallback bookOnPressed;

  const TableWidget({
    super.key,
    required this.bookOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    void tableWidgetOnTap() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50),

                  /// #name textfield
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),

                  /// #book button
                  ElevatedButton(
                    onPressed: bookOnPressed,
                    child: Text('Book'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return InkWell(
      onTap: tableWidgetOnTap,
      customBorder: CircleBorder(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 5),
        ),
        child: SizedBox(
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}

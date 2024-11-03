import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tablesList = [
      for (int i = 0; i < 6; i++)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < 3; i++) TableWidget(),
          ],
        ),
    ];

    return Scaffold(
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
  const TableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    /// #
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Book'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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

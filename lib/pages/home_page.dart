import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final tablesList = List.generate(6, (index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          3,
          (index) => TableWidget(),
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

class TableWidget extends StatefulWidget {
  const TableWidget({
    super.key,
  });

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;

  /// #main functions
  void bookOnPressed(TextEditingController nameController) {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text;

      Navigator.pushReplacementNamed(
        context,
        'order-details-page',
        arguments: name,
      );
    }
  }

  String? nameValidator(String? value) {
    final cleanedValue = value?.trim() ?? '';

    if (cleanedValue.isEmpty) {
      return 'Name cannot be empty';
    } else {
      return null;
    }
  }

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
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: nameValidator,
                  ),
                ),
                SizedBox(height: 20),

                /// #book button
                ElevatedButton(
                  onPressed: () => bookOnPressed(nameController),
                  child: Text('Book'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// #initial settings
  void initAllControllers() {
    nameController = TextEditingController();
  }

  void disposeAllControllers() {
    nameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    initAllControllers();
  }

  @override
  void dispose() {
    disposeAllControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

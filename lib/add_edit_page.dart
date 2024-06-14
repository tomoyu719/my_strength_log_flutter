import 'package:flutter/material.dart';

class AddEditPage extends StatelessWidget {
  const AddEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add/Edit Page'),
      ),
      body: const Center(
        child: Text('Add/Edit Page'),
      ),
    );
  }
}

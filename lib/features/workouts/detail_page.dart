import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, this.id = '-1'});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Text('Detail Page $id'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('＼(^o^)／')),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go('/list'),
              child: const Text('go back'),
            ),
          ),
        ],
      ),
    );
  }
}

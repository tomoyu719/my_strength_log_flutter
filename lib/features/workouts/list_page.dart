import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_strength_log_flutter/model/mock_workouts.dart';

final workoutsProvider = FutureProvider((ref) async {
  await Future<void>.delayed(const Duration(seconds: 2));
  return workoutsMocks;
});

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  static const icon = Icons.list;
  static const label = 'List';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: ref.watch(workoutsProvider).when(
            data: (workouts) => RefreshIndicator(
              onRefresh: () => ref.refresh(workoutsProvider.future),
              child: ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  final workout = workouts[index];
                  return ListTile(
                    title: Text(workout.id),
                    onTap: () =>
                        context.push('/list/detail', extra: workout.id),
                  );
                },
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error occurred'),
                  ElevatedButton(
                    onPressed: () => ref.refresh(workoutsProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

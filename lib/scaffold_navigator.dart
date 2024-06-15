import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_strength_log_flutter/list_page.dart';
import 'package:my_strength_log_flutter/statistics_page.dart';

class ScaffoldNavigator extends StatefulWidget {
  const ScaffoldNavigator({super.key, required this.child});
  final Widget child;
  @override
  State<ScaffoldNavigator> createState() => _ScaffoldNavigatorState();
}

class _ScaffoldNavigatorState extends State<ScaffoldNavigator> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandScape = orientation == Orientation.landscape;
        return Scaffold(
          bottomNavigationBar: isLandScape
              ? null
              : NavigationBar(
                  onDestinationSelected: (int index) =>
                      _onItemTapped(index, context),
                  selectedIndex: _calculateSelectedIndex(context),
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(ListPage.icon),
                      label: ListPage.label,
                    ),
                    NavigationDestination(
                      icon: Icon(StatisticsPage.icon),
                      label: StatisticsPage.label,
                    ),
                  ],
                ),
          body: isLandScape
              ? Row(
                  children: [
                    NavigationRail(
                      labelType: NavigationRailLabelType.all,
                      onDestinationSelected: (int index) =>
                          _onItemTapped(index, context),
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(ListPage.icon),
                          label: Text(ListPage.label),
                        ),
                        NavigationRailDestination(
                          icon: Icon(StatisticsPage.icon),
                          label: Text(StatisticsPage.label),
                        ),
                      ],
                      selectedIndex: _calculateSelectedIndex(context),
                    ),
                    Expanded(child: widget.child),
                  ],
                )
              : widget.child,
          floatingActionButton: FloatingActionButton(
            onPressed: () => GoRouter.of(context).push('/addEdit'),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/list')) {
      return 0;
    }
    if (location.startsWith('/statistics')) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/list');
      case 1:
        GoRouter.of(context).go('/statistics');
    }
  }
}

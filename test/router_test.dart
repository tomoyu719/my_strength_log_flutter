import 'package:flutter_test/flutter_test.dart';
import 'package:my_strength_log_flutter/app.dart';
import 'package:my_strength_log_flutter/detail_page.dart';
import 'package:my_strength_log_flutter/error_page.dart';
import 'package:my_strength_log_flutter/list_page.dart';
import 'package:my_strength_log_flutter/router.dart';
import 'package:my_strength_log_flutter/statistics_page.dart';

void main() {
  testWidgets('Initial route should be /list', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(ListPage), findsOneWidget);
  });

  testWidgets('Navigating to /list should display ListPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    router.go('/list');
    await tester.pumpAndSettle();

    expect(find.byType(ListPage), findsOneWidget);
  });

  testWidgets('Navigating to /list/detail should display DetailPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    router.go('/list/detail');
    await tester.pumpAndSettle();

    expect(find.byType(DetailPage), findsOneWidget);
  });

  testWidgets('Navigating to /statistics should display StatisticsPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    router.go('/statistics');
    await tester.pumpAndSettle();

    expect(find.byType(StatisticsPage), findsOneWidget);
  });

  testWidgets('Navigating to unknown route should display ErrorPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    router.go('/unknown');
    await tester.pumpAndSettle();

    expect(find.byType(ErrorPage), findsOneWidget);
  });
}

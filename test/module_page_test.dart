import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lat_set_state/provider/done_module_provider.dart';
import 'package:lat_set_state/ui/module_page.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<DoneModuleProvider>(
      create: (context) => DoneModuleProvider(),
      child: MaterialApp(
        home: ModulePage(),
      ),
    );

void main() {
  group('Module list page widget test', () {
    testWidgets('Testing if ListView show up ', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Test done button', (tester) async {
      // Me-render widget
      await tester.pumpWidget(createHomeScreen());
      // Mencari ElevatedButton pertama kemudian melakukan gestur tap
      await tester.tap(find.byType(ElevatedButton).first);
      // Rebuild tampilan karena perubahan state
      await tester.pumpAndSettle();
      // Verifikasi apakah ditemukan 2 ikon done
      expect(find.byIcon(Icons.done), findsNWidgets(2));
    });
  });
}

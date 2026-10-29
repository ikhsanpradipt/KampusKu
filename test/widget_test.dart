import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kampusku/app.dart';

Future<void> _loadTestFonts() async {
  try {
    final robotoLoader = FontLoader('Roboto');
    final robotoBytes = await File(
      r'C:\src\flutter\bin\cache\artifacts\material_fonts\roboto-regular.ttf',
    ).readAsBytes();
    robotoLoader.addFont(Future.value(ByteData.sublistView(robotoBytes)));
    await robotoLoader.load();

    final iconsLoader = FontLoader('MaterialIcons');
    final iconsBytes = await File(
      r'C:\src\flutter\bin\cache\artifacts\material_fonts\materialicons-regular.otf',
    ).readAsBytes();
    iconsLoader.addFont(Future.value(ByteData.sublistView(iconsBytes)));
    await iconsLoader.load();
  } catch (_) {}
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await _loadTestFonts();
    await initializeDateFormatting('id_ID');
  });

  testWidgets('KampusKu smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const KampusKuApp());

    expect(find.text('KampusKu'), findsOneWidget);
    expect(find.text('Pemrograman Mobile II'), findsOneWidget);
    expect(find.text('Keamanan Informasi'), findsOneWidget);
  });

  testWidgets('Target 1 - Android HP / Emulator screenshot', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(412, 860);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      Theme(
        data: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF1565C0),
          ),
        ),
        child: const KampusKuApp(),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(KampusKuApp),
      matchesGoldenFile('../screenshots/target_android_hp.png'),
    );
  });

  testWidgets('Target 2 - Web Chrome screenshot', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1000, 700);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      Theme(
        data: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF1565C0),
          ),
        ),
        child: const KampusKuApp(),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(KampusKuApp),
      matchesGoldenFile('../screenshots/target_chrome_web.png'),
    );
  });
}

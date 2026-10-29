import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kampusku/app.dart';

void main() {
  testWidgets('KampusKu smoke test', (WidgetTester tester) async {
    await initializeDateFormatting('id_ID');
    await tester.pumpWidget(const KampusKuApp());

    expect(find.text('KampusKu'), findsOneWidget);
    expect(find.text('Pemrograman Mobile II'), findsOneWidget);
    expect(find.text('Basis Data'), findsOneWidget);
  });
}

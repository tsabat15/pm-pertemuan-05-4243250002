import 'package:flutter_test/flutter_test.dart';
import 'package:kartu_nama/main.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('Tombol Ikuti menambah jumlah pengikut', (tester) async {
    await tester.pumpWidget(const KartuNamaApp());
    expect(find.text('Muhammad Tsabat Muhyiyuddin'), findsOneWidget);
    expect(find.text('128 pengikut'), findsOneWidget);

    await tester.ensureVisible(find.text('Ikuti'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ikuti'));
    await tester.pump();

    expect(find.text('129 pengikut'), findsOneWidget);
    expect(find.text('Diikuti'), findsOneWidget);
  });

  testWidgets('Tombol di AppBar mengganti tema', (tester) async {
    await tester.pumpWidget(const KartuNamaApp());
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);

    await tester.tap(find.byIcon(Icons.dark_mode));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.light_mode), findsOneWidget);
  });

  testWidgets('Baris kontak menampilkan SnackBar', (tester) async {
    await tester.pumpWidget(const KartuNamaApp());

    await tester.tap(find.text('NIM 4243250002'));
    await tester.pump();

    expect(find.text('Disalin: NIM 4243250002'), findsOneWidget);
  });
}

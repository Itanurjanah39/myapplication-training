// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_application/main.dart';
import 'package:my_application/main_import.dart';

void main() {
  testWidgets('My application test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

      // Memastikan AppBar ditampilkan dengan teks yang benar
    expect(find.text('My Application'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);

    expect(find.text('Taman Mini'), findsOneWidget);
    expect(find.image(const AssetImage('assets/image/birds.jpg')), findsOneWidget);


  });
}

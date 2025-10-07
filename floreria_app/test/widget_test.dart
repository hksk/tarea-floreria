import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:floreria_app/main.dart';
import 'package:floreria_app/providers/carrito_provider.dart';

void main() {
  testWidgets('App initialization test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FloreriaApp());

    // Verify that the app loads with the home screen
    expect(find.text('🌸 Florería Bella'), findsOneWidget);
    expect(find.text('Las flores más hermosas para ti'), findsOneWidget);
  });

  testWidgets('Add flower to cart test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FloreriaApp());

    // Wait for the flowers to load
    await tester.pumpAndSettle();

    // Find the first flower card and tap the add to cart button
    expect(find.byType(Card), findsWidgets);

    // Find the first add to cart button
    final addButtons = find.byIcon(Icons.add_shopping_cart);
    expect(addButtons, findsWidgets);

    // Tap the first add button
    await tester.tap(addButtons.first);
    await tester.pump();

    // Verify that the snackbar appears
    expect(find.text('agregada al carrito'), findsOneWidget);
  });
}

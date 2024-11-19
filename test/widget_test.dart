import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:message_board_app/main.dart'; // Ensure MyApp is properly imported
import 'test_utils.dart';

void main() {
  setupFirebaseAuthMocks(); // Mock Firebase services

  setUpAll(() async {
    await Firebase.initializeApp(); // Initialize Firebase with mocks
  });

  testWidgets('App should start with splash screen', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Verify splash screen appears
    expect(find.text('Message Board App'), findsOneWidget);
    expect(find.byIcon(Icons.message), findsOneWidget);
  });


  testWidgets('Login screen should have email and password fields', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    // Check if "Login" screen is displayed after splash
    expect(find.text('Login'), findsOneWidget);

    // Check for email and password fields
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Check for "Create an account" button or link
    expect(find.text('Create an account'), findsOneWidget);
  });
}
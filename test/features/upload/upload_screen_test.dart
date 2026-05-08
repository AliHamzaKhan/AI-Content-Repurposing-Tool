import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:repurpose_ai/features/upload/presentation/upload_screen.dart';

void main() {
  testWidgets('UploadScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: UploadScreen()));

    expect(find.text('Upload Your Content'), findsOneWidget);
    expect(find.text('REPURPOSE CONTENT'), findsOneWidget);
    expect(find.byType(ChoiceChip), findsAtLeastNWidgets(4));
  });
}

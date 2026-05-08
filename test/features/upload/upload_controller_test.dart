import 'package:flutter_test/flutter_test.dart';
import 'package:repurpose_ai/features/upload/controllers/upload_controller.dart';
import 'package:get/get.dart';

void main() {
  group('UploadController Test', () {
    late UploadController controller;

    setUp(() {
      controller = UploadController();
    });

    test('Initial credits should be 10', () {
      expect(controller.credits.value, 10);
    });

    test('setType should update selectedType', () {
      controller.setType(ContentType.meeting);
      expect(controller.selectedType.value, ContentType.meeting);
    });

    test('fileName should be initially empty', () {
      expect(controller.fileName.value, '');
    });
  });
}

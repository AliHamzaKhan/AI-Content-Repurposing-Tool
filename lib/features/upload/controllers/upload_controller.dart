import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

enum ContentType { podcast, lecture, khutbah, meeting }

class UploadController extends GetxController {
  var selectedType = ContentType.podcast.obs;
  var fileName = ''.obs;
  var isUploading = false.obs;
  var credits = 10.obs;

  void setType(ContentType type) {
    selectedType.value = type;
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'mp4', 'm4a'],
    );

    if (result != null) {
      fileName.value = result.files.single.name;
    }
  }

  Future<void> startProcessing() async {
    if (fileName.isEmpty) {
      Get.snackbar('Error', 'Please select a file first');
      return;
    }

    if (credits.value <= 0) {
      Get.snackbar('Insufficient Credits', 'Please upgrade your subscription',
        onTap: (_) => Get.toNamed('/subscription'));
      return;
    }

    isUploading.value = true;

    // Simulate upload and processing
    await Future.delayed(const Duration(seconds: 3));

    credits.value -= 1;
    isUploading.value = false;

    Get.toNamed('/results');
  }
}

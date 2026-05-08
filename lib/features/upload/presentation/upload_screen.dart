import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/upload_controller.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repurpose AI'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() => Center(
                  child: Text(
                    'Credits: ${controller.credits.value}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () => Get.toNamed('/subscription'),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Upload Your Content',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Transform your audio/video into viral content using AI',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Select Content Type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                Obx(() => Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: ContentType.values.map((type) {
                        final isSelected = controller.selectedType.value == type;
                        return ChoiceChip(
                          label: Text(type.name.capitalizeFirst!),
                          selected: isSelected,
                          onSelected: (_) => controller.setType(type),
                          avatar: Icon(
                            _getIconForType(type),
                            size: 16,
                            color: isSelected ? Colors.white : null,
                          ),
                        );
                      }).toList(),
                    )),
                const SizedBox(height: 32),
                InkWell(
                  onTap: controller.pickFile,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        width: 2,
                        style: BorderStyle.solid, // Simple dashed not built-in easily
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).primaryColor.withOpacity(0.05),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.cloud_upload_outlined, size: 48),
                        const SizedBox(height: 16),
                        Obx(() => Text(
                              controller.fileName.isEmpty
                                  ? 'Click to select audio or video'
                                  : controller.fileName.value,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            )),
                        const Text(
                          'MP3, WAV, MP4, M4A up to 500MB',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Obx(() => ElevatedButton(
                      onPressed: controller.isUploading.value
                          ? null
                          : controller.startProcessing,
                      child: controller.isUploading.value
                          ? const CircularProgressIndicator()
                          : const Text('REPURPOSE CONTENT'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForType(ContentType type) {
    switch (type) {
      case ContentType.podcast:
        return FontAwesomeIcons.microphone;
      case ContentType.lecture:
        return FontAwesomeIcons.chalkboardUser;
      case ContentType.khutbah:
        return FontAwesomeIcons.mosque;
      case ContentType.meeting:
        return FontAwesomeIcons.users;
    }
  }
}

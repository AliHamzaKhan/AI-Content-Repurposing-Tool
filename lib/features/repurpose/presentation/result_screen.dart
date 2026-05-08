import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../upload/controllers/upload_controller.dart';
import '../domain/ai_service.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadController = Get.find<UploadController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Results'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offAllNamed('/upload'),
        ),
      ),
      body: FutureBuilder<RepurposedContent>(
        future: AIService.generateContent(
          uploadController.fileName.value,
          uploadController.selectedType.value.name,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 24),
                  Text('AI is analyzing your content...'),
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data!;

          return DefaultTabController(
            length: 5,
            child: Column(
              children: [
                const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Captions'),
                    Tab(text: 'Summary'),
                    Tab(text: 'Tweets'),
                    Tab(text: 'Blog Post'),
                    Tab(text: 'Subtitles'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _ResultTab(content: data.reelsCaptions),
                      _ResultTab(content: data.summary),
                      _ResultTab(
                        content: data.tweets.join('\n\n---\n\n'),
                        isList: true,
                      ),
                      _ResultTab(content: data.blogPost),
                      _ResultTab(content: data.subtitles),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ResultTab extends StatelessWidget {
  final String content;
  final bool isList;

  const _ResultTab({required this.content, this.isList = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 0,
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: SelectableText(
                    content,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: content));
                  Get.snackbar('Copied', 'Content copied to clipboard',
                      snackPosition: SnackPosition.BOTTOM);
                },
                icon: const Icon(Icons.copy),
                label: const Text('COPY TO CLIPBOARD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

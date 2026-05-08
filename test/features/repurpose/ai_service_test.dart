import 'package:flutter_test/flutter_test.dart';
import 'package:repurpose_ai/features/repurpose/domain/ai_service.dart';

void main() {
  group('AIService Test', () {
    test('generateContent should return RepurposedContent', () async {
      final content = await AIService.generateContent('test_file.mp3', 'podcast');

      expect(content, isA<RepurposedContent>());
      expect(content.reelsCaptions, contains('test_file.mp3'));
      expect(content.summary, isNotEmpty);
      expect(content.tweets.length, 3);
      expect(content.blogPost, isNotEmpty);
      expect(content.subtitles, isNotEmpty);
    });
  });
}

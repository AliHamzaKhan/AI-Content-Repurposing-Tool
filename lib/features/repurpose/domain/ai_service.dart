class RepurposedContent {
  final String reelsCaptions;
  final String summary;
  final List<String> tweets;
  final String blogPost;
  final String subtitles;

  RepurposedContent({
    required this.reelsCaptions,
    required this.summary,
    required this.tweets,
    required this.blogPost,
    required this.subtitles,
  });
}

class AIService {
  static Future<RepurposedContent> generateContent(String fileName, String type) async {
    // Mock processing delay
    await Future.delayed(const Duration(seconds: 1));

    return RepurposedContent(
      reelsCaptions: "🚀 WOW! You won't believe what happened in this $type about $fileName!\n\nCheck out these key takeaways:\n1. 💎 Innovation is key\n2. 📈 Consistency wins\n3. 🔥 Never give up\n\n#AI #Repurpose #ContentCreator",
      summary: "This $type discusses the importance of leveraging AI tools to scale content production. The speaker emphasizes that $fileName is a prime example of high-quality long-form content that can be broken down into smaller, engaging pieces.",
      tweets: [
        "Just finished listening to $fileName. AI is changing the game! 🤖 #AI #Tech",
        "Key takeaway from today's $type: Your content is your leverage. Use it wisely. 💡",
        "If you're not repurposing your $type, you're leaving growth on the table. 📉➡️📈",
      ],
      blogPost: "# Why $fileName Matters in 2024\n\nIn our latest $type, we dived deep into the themes of $fileName. The discussion was enlightening, covering everything from the basics to advanced strategies.\n\n## Key Points\n- **Efficiency:** How to work smarter.\n- **Reach:** Expanding your audience.\n- **Impact:** Making a difference with your message.\n\nStay tuned for more!",
      subtitles: "[00:00:05] Welcome to today's session on $fileName.\n[00:00:12] We're going to explore how this $type can change your perspective.\n[00:00:25] First, let's look at the data.",
    );
  }
}

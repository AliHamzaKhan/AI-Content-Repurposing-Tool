import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../upload/controllers/upload_controller.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UploadController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade Subscription'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                const Text(
                  'Choose Your Plan',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Get more credits to repurpose your content with AI',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 700) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _PricingCard(
                            title: 'Free',
                            price: '\$0',
                            credits: '3 credits',
                            features: const ['1 upload/month', 'Basic summaries'],
                            onTap: () {},
                          )),
                          const SizedBox(width: 24),
                          Expanded(child: _PricingCard(
                            title: 'Pro',
                            price: '\$19',
                            credits: '50 credits',
                            isPopular: true,
                            features: const [
                              'All content types',
                              'Priority processing',
                              'HD Subtitles export'
                            ],
                            onTap: () {
                              controller.credits.value += 50;
                              Get.back();
                              Get.snackbar('Success', '50 credits added to your account!');
                            },
                          )),
                          const SizedBox(width: 24),
                          Expanded(child: _PricingCard(
                            title: 'Agency',
                            price: '\$49',
                            credits: '200 credits',
                            features: const [
                              'Multiple users',
                              'API Access',
                              'Custom branding'
                            ],
                            onTap: () {
                              controller.credits.value += 200;
                              Get.back();
                              Get.snackbar('Success', '200 credits added to your account!');
                            },
                          )),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _PricingCard(
                            title: 'Free',
                            price: '\$0',
                            credits: '3 credits',
                            features: const ['1 upload/month', 'Basic summaries'],
                            onTap: () {},
                          ),
                          const SizedBox(height: 24),
                          _PricingCard(
                            title: 'Pro',
                            price: '\$19',
                            credits: '50 credits',
                            isPopular: true,
                            features: const [
                              'All content types',
                              'Priority processing',
                              'HD Subtitles export'
                            ],
                            onTap: () {
                              controller.credits.value += 50;
                              Get.back();
                              Get.snackbar('Success', '50 credits added to your account!');
                            },
                          ),
                          const SizedBox(height: 24),
                          _PricingCard(
                            title: 'Agency',
                            price: '\$49',
                            credits: '200 credits',
                            features: const [
                              'Multiple users',
                              'API Access',
                              'Custom branding'
                            ],
                            onTap: () {
                              controller.credits.value += 200;
                              Get.back();
                              Get.snackbar('Success', '200 credits added to your account!');
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String credits;
  final List<String> features;
  final VoidCallback onTap;
  final bool isPopular;

  const _PricingCard({
    required this.title,
    required this.price,
    required this.credits,
    required this.features,
    required this.onTap,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isPopular ? 8 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: isPopular
            ? BorderSide(color: Theme.of(context).primaryColor, width: 2)
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            if (isPopular)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'MOST POPULAR',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(price, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Text('/ month', style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 24),
            Text(credits, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Divider(height: 48),
            ...features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 18),
                      const SizedBox(width: 12),
                      Expanded(child: Text(f)),
                    ],
                  ),
                )),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPopular ? Theme.of(context).primaryColor : null,
                  foregroundColor: isPopular ? Colors.white : null,
                ),
                child: const Text('GET STARTED'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme.dart';
import 'features/upload/presentation/upload_screen.dart';
import 'features/repurpose/presentation/result_screen.dart';
import 'features/subscription/presentation/subscription_screen.dart';

void main() {
  runApp(const RepurposeAIApp());
}

class RepurposeAIApp extends StatelessWidget {
  const RepurposeAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Repurpose AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/upload',
      getPages: [
        GetPage(
          name: '/upload',
          page: () => const UploadScreen(),
        ),
        GetPage(
          name: '/results',
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: '/subscription',
          page: () => const SubscriptionScreen(),
        ),
      ],
    );
  }
}

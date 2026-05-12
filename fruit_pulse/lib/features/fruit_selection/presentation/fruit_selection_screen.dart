import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/app_card.dart';

class FruitSelectionScreen extends StatelessWidget {
  const FruitSelectionScreen({super.key});

  static const List<Map<String, dynamic>> fruits = [
    {
      'id': 'banana',
      'name': AppStrings.banana,
      'image': '🍌',
      'color': AppColors.primaryOrange,
    },
    {
      'id': 'mango',
      'name': AppStrings.mango,
      'image': '🥭',
      'color': AppColors.primaryOrange,
    },
    {
      'id': 'apple',
      'name': AppStrings.apple,
      'image': '🍎',
      'color': AppColors.primaryRed,
    },
    {
      'id': 'papaya',
      'name': AppStrings.papaya,
      'image': '🍈',
      'color': AppColors.primaryOrange,
    },
    {
      'id': 'orange',
      'name': AppStrings.orange,
      'image': '🍊',
      'color': AppColors.primaryOrange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appName, // Fruit Pulse
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a fruit to analyze',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  final fruit = fruits[index];
                  return FruitCard(
                    fruit: fruit,
                    onTap: () =>
                        context.push('/analysis?fruitId=${fruit['id']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FruitCard extends StatelessWidget {
  final Map<String, dynamic> fruit;
  final VoidCallback onTap;

  const FruitCard({super.key, required this.fruit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      gradient: LinearGradient(
        colors: [
          fruit['color'].withValues(alpha: 0.2),
          fruit['color'].withValues(alpha: 0.1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(fruit['image'], style: const TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          Text(
            fruit['name'],
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: fruit['color'],
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: fruit['color'].withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Tap to analyze',
              style: TextStyle(
                color: fruit['color'],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

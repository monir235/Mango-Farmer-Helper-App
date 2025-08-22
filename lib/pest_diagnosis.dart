import 'package:flutter/material.dart';

class PestDiagnosisPage extends StatelessWidget {
  const PestDiagnosisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('পোকা ও রোগ নির্ণয়'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'আমের জন্য পোকা ও রোগ নির্ণয়',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Text(
              'একটি আমের পাতা বা ফলের ছবি আপলোড করুন যাতে সাধারণ রোগ ও পোকার আক্রমণ শনাক্ত করা যায়। '
                  'বর্তমানে, এই ফিচারটি একটি প্লেসহোল্ডার এবং ভবিষ্যতে এটি এআই দ্বারা উন্নত করা হবে।',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/mango_disease_symptoms.png', // Replace this with your real image
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'সাধারণ আমের পোকা ও রোগসমূহ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            _buildDiseaseCard(
              title: 'পাউডারি মিলডিউ',
              description:
              'একটি ছত্রাকজনিত রোগ যা পাতায়, ফুলে ও কাঁচা ফলে সাদা গুঁড়ার মতো দাগ তৈরি করে। এটি আগাম ফল ঝরে পড়ার কারণ হয়।',
              imagePath: 'assets/powdery_mildew.jpg',
            ),

            _buildDiseaseCard(
              title: 'অ্যানথ্রাকনোজ',
              description:
              'পাতা, ফুল ও ফলে কালো দাগ সৃষ্টি করে। মারাত্মক আক্রমণে ফল পচে যায় ও পাতা ঝরে পড়ে।',
              imagePath: 'assets/anthracnose.png',
            ),

            _buildDiseaseCard(
              title: 'আম হপার',
              description:
              'ছোট পোকা যারা কচি ডাল ও ফুল থেকে রস শোষণ করে, যার ফলে ফুল ঝরে পড়ে ও ফলন কমে যায়।',
              imagePath: 'assets/mango_hopper.webp',
            ),

            _buildDiseaseCard(
              title: 'মিলিবাগ',
              description:
              'সাদা মোমজাতীয় পদার্থে ঢাকা রস শোষণকারী পোকা, যা পাতাকে কুঁচকে দেয় এবং কালো ছাঁচ জন্মায়।',
              imagePath: 'assets/mealybugs.jpg',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('আপলোড ফিচার শীঘ্রই আসছে!')),
                );
              },
              child: const Text('পাতা/ফলের ছবি আপলোড করুন'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiseaseCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(description,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mangoapp/different_mango.dart';
import 'package:mangoapp/yield_estimator.dart'; // Add this line at the top
// Import the new page

class CultivationPage extends StatelessWidget {
  const CultivationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আম গাছের চাষ'),
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView for scrollable content
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[ // Removed 'const' here because we are adding non-const widgets like ElevatedButton
            const Text(
              'আম গাছের চাষের পরিচিতি',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 15),
            const Text(
              'আম হল трপিক্যাল ফল যা তাদের মিষ্টি স্বাদ এবং উজ্জ্বল রঙের জন্য পরিচিত। সফল চাষের জন্য জলবায়ু, মাটি এবং সঠিক যত্নের প্রতি মনোযোগ দিতে হয়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // --- New Button for Different Mangoes ---
            Center( // Center the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DifferentMangoesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen, // A different color for this button
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('বিভিন্ন ধরনের আম সম্পর্কে জানুন'),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const YieldEstimatorPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('উৎপাদন পূর্বানুমান'),
              ),
            ),

            const SizedBox(height: 30), // Spacing after the button

            // --- Existing Content Below ---
            const Text(
              '১. জলবায়ু এবং মাটির চাহিদা:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'আম গাছ трপিক্যাল এবং সাব-тропিক্যাল জলবায়ুতে ভালো জন্মে, যেখানে স্পষ্টভাবে ভিজে এবং শুষ্ক ঋতু থাকে। আদর্শ তাপমাত্রা ২৪°সেলসিয়াস থেকে ৩০°সেলসিয়াসের মধ্যে। তারা ভাল-নিষ্কাশিত, গভীর, দোআঁশ মাটি পছন্দ করে যার pH ৫.৫ থেকে ৭.৫ এর মধ্যে।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '২. রোপণ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'প্রজনন সাধারণত গ্রাফটিং বা বাডিং এর মাধ্যমে করা হয়। নবীন গাছগুলি পূর্বে খুঁড়ে রাখা গর্তে (১মি x ১মি x ১মি) মাটি, কম্পোস্ট এবং বালির মিশ্রণে রোপণ করুন। গাছগুলির মধ্যে পর্যাপ্ত দুরত্ব বজায় রাখুন (যেমন ১০-১২ মিটার) যাতে তারা সঠিকভাবে বৃদ্ধি পায় এবং সূর্যালোক পায়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৩. সেচ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'নিয়মিত জল দেওয়া বিশেষ করে শুরুতে এবং ফল ধরার সময় খুব গুরুত্বপূর্ণ। ফুল আসার সময় সেচ কমানো উচিত যাতে ফল ধরতে সাহায্য হয়। ড্রিপ সেচ জল ব্যবহারে অত্যন্ত কার্যকর।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৪. সার দেওয়া:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'নাইট্রোজেন, ফসফরাস এবং পটাশিয়াম সমৃদ্ধ সুষম সার প্রয়োগ করুন। সার দেওয়ার পরিমাণ এবং প্রকার মাটির পরীক্ষার ফলাফল এবং গাছের বয়সের উপর নির্ভর করবে। জিঙ্ক এবং বোরনের মতো ক্ষুদ্র উপাদানও গুরুত্বপূর্ণ।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৫. কীট ও রোগ নিয়ন্ত্রণ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'সাধারণ কীটের মধ্যে রয়েছে ফলের মাছি, মেলিবাগ এবং হপার। রোগের মধ্যে রয়েছে পাউডারি মিলডিউ এবং এনথ্রাকনোজ যা আম গাছকে প্রভাবিত করতে পারে। সমন্বিত কীট নিয়ন্ত্রণ (IPM) কৌশল ব্যবহার করুন, যার মধ্যে নিয়মিত পর্যবেক্ষণ, জীববৈচিত্র্য নিয়ন্ত্রণ এবং প্রয়োজন অনুযায়ী ছত্রাকনাশক/পোকার ওষুধ ব্যবহার অন্তর্ভুক্ত।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৬. ছাঁটাই:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'ছাঁটাই গাছের আকৃতি বজায় রাখতে, বাতাস চলাচল বাড়াতে এবং ফল উৎপাদন উন্নত করতে সাহায্য করে। মৃত, রোগাক্রান্ত বা অতিরিক্ত শাখাগুলো কেটে ফেলুন। হালকা ছাঁটাই ফল সংগ্রহের পর করা যায়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৭. ফল সংগ্রহ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'আম সাধারণত তখন কাটা হয় যখন তারা শারীরিকভাবে পরিপক্ক হয়, যা সামান্য রঙ পরিবর্তন এবং দৃঢ়তা দ্বারা চিহ্নিত হয়। সাবধানে ফল কেটে নিন যাতে কোন ক্ষতি না হয়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

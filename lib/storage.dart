import 'package:flutter/material.dart';

class StoragePage extends StatelessWidget {
  const StoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আম সংরক্ষণ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[ // Removed 'const' here because we are adding non-const widgets like Image.asset
            const Text(
              'কার্যকর আম সংরক্ষণ পদ্ধতি',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 15),
            const Text(
              'আমের মেয়াদ বাড়াতে, নষ্ট হওয়া কমাতে এবং গুণগত মান বজায় রাখতে সঠিক সংরক্ষণ খুবই গুরুত্বপূর্ণ যতক্ষণ না এগুলো ভোক্তা বা প্রক্রিয়াকরণ ইউনিটে পৌঁছায়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // --- New Image and Caption Section ---
            Center( // Center the image and caption
              child: Column(
                children: [
                  Image.asset(
                    'assets/storage.jpg', // Path to your image
                    fit: BoxFit.cover, // Adjust how the image fits
                    width: MediaQuery.of(context).size.width * 0.8, // Make image responsive, 80% of screen width
                    height: 200, // Fixed height for consistency
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'ছবি লোড করতে পারেনি: storage.jpg',
                        style: TextStyle(color: Colors.red),
                      );
                    },
                  ),
                  const SizedBox(height: 10), // Spacing between image and caption
                  const Text(
                    'আমের জন্য আদর্শ সংরক্ষণের শর্তাবলী',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Spacing after the image and caption

            // --- Existing Content Below ---
            const Text(
              '১. প্রি-কুলিং:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'কাটা ও রস নিষ্কাশনের পর সঙ্গে সঙ্গেই আম প্রি-কুলিং করুন যাতে ক্ষেতের তাপ কমে যায়। এটি ফোর্সড-এয়ার কুলিং বা হাইড্রো-কুলিং এর মাধ্যমে করা যায়। প্রি-কুলিং শ্বাসপ্রশ্বাস এবং পাকা প্রক্রিয়া ধীর করে, যা Shelf life উল্লেখযোগ্যভাবে বাড়ায়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '২. সংরক্ষণের তাপমাত্রা ও আর্দ্রতা:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'পরিপক্ক সবুজ আমের জন্য আদর্শ সংরক্ষণের তাপমাত্রা সাধারণত ১২°C থেকে ১৫°C (৫৪°F থেকে ৫৯°F) এর মধ্যে। ১০°C (৫০°F) এর নিচে তাপমাত্রা শীতজনিত ক্ষতি সৃষ্টি করতে পারে, যা পাকা প্রক্রিয়া বাধাগ্রস্ত করে, ত্বকের রঙ ফিকে করে এবং অভ্যন্তরীণ ক্ষতি ঘটায়। আপেক্ষিক আর্দ্রতা ৯০-৯৫% বজায় রাখা উচিত যাতে আমড়া শুকিয়ে না যায় এবং সঙ্কুচিত না হয়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৩. বায়ুচলাচল:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'সংরক্ষণ এলাকায় পর্যাপ্ত বায়ু সঞ্চালন নিশ্চিত করুন। সঠিক বায়ুচলাচল ইথিলিন গ্যাস (প্রাকৃতিক পাকানোর হরমোন) এবং অতিরিক্ত তাপ দূর করে, যা পাকানো এবং নষ্ট হওয়া গতি ধীর করে।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৪. সংরক্ষণের জন্য প্যাকেজিং:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'আম একক স্তরে ভাল বায়ুচলাচল সম্পন্ন ক্রেট বা কার্টনে প্যাক করুন। প্যাকিংয়ের মধ্যে কাগজের টুকরো বা ফোম নেট ব্যবহার করলে হাতল এবং স্তূপন করার সময় আঘাত কমে। প্লাস্টিক ব্যাগ ব্যবহার এড়িয়ে চলুন যদি না বিশেষভাবে পরিবর্তিত বায়ুমণ্ডল প্যাকেজিং ব্যবহার করা হয়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৫. পাকানোর চেম্বার (নিয়ন্ত্রিত পাকানো):',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'বাণিজ্যিক উদ্দেশ্যে, আম নিয়ন্ত্রিত চেম্বারে ইথিলিন গ্যাস ব্যবহার করে পাকানো হয়। এতে সমান মাত্রার পাকানো নিশ্চিত হয় এবং বাজারের সময় ভালোভাবে সামঞ্জস্য করা যায়। পাকানোর পর অবশিষ্ট ইথিলিন দূর করতে সঠিক বায়ুচলাচল নিশ্চিত করুন।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৬. ঘরের সংরক্ষণের পরামর্শ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'অপক্ক আম ঘরের তাপমাত্রায় সংরক্ষণ করুন যতক্ষণ না এগুলো পাকছে। পাকা হলে কয়েকদিনের জন্য ফ্রিজে রাখা যেতে পারে যাতে আরো পাকানো ধীর হয়। অপক্ক আমড়া ফ্রিজে রাখবেন না কারণ এতে শীতজনিত ক্ষতি হতে পারে এবং সঠিকভাবে পাকা হয় না।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

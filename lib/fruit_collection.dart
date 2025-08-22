import 'package:flutter/material.dart';

class FruitCollectionPage extends StatelessWidget {
  const FruitCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ফল সংগ্রহ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'আম সংগ্রহের সেরা পদ্ধতি',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 15),
            const Text(
              'সঠিক সময়ে এবং উপযুক্ত পদ্ধতিতে ফল সংগ্রহ করা অত্যন্ত গুরুত্বপূর্ণ, যাতে উন্নতমানের আম পাওয়া যায় এবং সংগ্রহ পরবর্তী ক্ষতি কমানো যায়। সময় ও কৌশল এখানে মুখ্য।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/mango_cultivation.webp',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'ছবি লোড করা যায়নি: mango_cultivation.webp',
                        style: TextStyle(color: Colors.red),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'আম সংগ্রহ: গুণমানের জন্য ফসল তোলা',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              '১. সঠিক সময় নির্বাচন:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'আম গাছে পরিপূর্ণভাবে পাকলে নয়, বরং শারীরবৃত্তীয় পরিপক্বতা অর্জনের সময় সংগ্রহ করা উচিত। লক্ষণসমূহ হল: ত্বকের রঙে সামান্য পরিবর্তন (গাঢ় সবুজ থেকে হালকা সবুজ বা হলুদাভ), ফলের দৃঢ়তা, এবং ডাঁটা পাশে একটি গন্ধের উপস্থিতি। অনেক আগেই তুললে গুণমান কমে যায়, আবার দেরি করে তুললে অতিরিক্ত পেকে নষ্ট হয়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '২. সংগ্রহের উপকরণ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'বিশেষ ধরণের আম সংগ্রহের খুঁটি ব্যবহার করুন যার নিচে জাল বা ব্যাগ থাকে, যাতে ফল পড়ে গিয়ে ক্ষতিগ্রস্ত না হয়। নিচের ডালপালার জন্য হাতে গ্লাভস পরে তোলা যায়। ফল জোরে টানা বা ছিঁড়ে নেওয়া যাবে না, এতে ডাঁটা ক্ষতিগ্রস্ত হয় এবং রস বেরিয়ে পোড়া দাগ হতে পারে।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৩. যত্নসহকারে হ্যান্ডলিং:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'আম অত্যন্ত সংবেদনশীল ও সহজে আঘাতপ্রাপ্ত হয়। তাই সংগ্রহ, পরিবহন এবং সংরক্ষণের প্রতিটি ধাপে সাবধানে হ্যান্ডল করতে হবে। নরম প্যাডযুক্ত ঝুড়ি বা বাক্সে ফলগুলো আলতোভাবে রাখতে হবে। ফেলা বা ছুঁড়ে মারার মতো কাজ করা যাবে না।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৪. রস ব্যবস্থাপনা:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'ফল সংগ্রহের সময় ডাঁটা থেকে রস বের হয়, যা ফলের গায়ে পড়লে কালো দাগ (sap burn) হতে পারে এবং বাজারমূল্য কমে যায়। এ থেকে রক্ষা পেতে ডাঁটা সহ (প্রায় ১-২ সেমি) সংগ্রহ করুন। এরপর কয়েক ঘণ্টা ফলগুলিকে ডাঁটা নিচে করে এমনভাবে রাখুন যাতে রস ফলের গায়ে না পড়ে।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৫. মাঠে বাছাই ও পরিষ্কার:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'সংগ্রহের পরপরই ক্ষতিগ্রস্ত, পঁচা বা অপরিপক্ব আম আলাদা করে ফেলুন। নরম কাপড় দিয়ে ধুলো বা ময়লা আলতোভাবে মুছে ফেলুন। যদি সরাসরি প্রক্রিয়াজাতকরণ ইউনিটে না পাঠানো হয়, তবে ধোয়া থেকে বিরত থাকুন, কারণ অতিরিক্ত আর্দ্রতা ছত্রাক জন্মাতে পারে।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৬. সংরক্ষণ/প্যাকিং কেন্দ্রে পরিবহন:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'সংগ্রহের পর যত দ্রুত সম্ভব আমগুলো সংরক্ষণ বা প্যাকিং কেন্দ্রে নিয়ে যান। এমন বাহন ব্যবহার করুন যা ভালো বায়ু চলাচলের সুযোগ দেয় এবং কম ঝাঁকুনি সৃষ্টি করে। পরিবহনের সময় সরাসরি রোদ থেকে রক্ষা করুন।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

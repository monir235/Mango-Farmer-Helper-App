import 'package:flutter/material.dart';

class ProcessingPage extends StatelessWidget {
  const ProcessingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আমের প্রক্রিয়াজাতকরণ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'আম প্রক্রিয়াজাতকরণ কৌশল',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 15),
            const Text(
              'আম বিভিন্ন পণ্যতে প্রক্রিয়াজাত করা যায়, যা এর মূল্য বৃদ্ধি করে এবং তাজা খাওয়ার বাইরে এর ব্যবহার বাড়ায়। সাধারণ প্রক্রিয়াজাত পণ্যের মধ্যে রয়েছে পাল্প, জুস, নেকটার, জ্যাম, আচার এবং শুকনো টুকরা।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/mango_processing.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'ছবি লোড করা যায়নি: mango_processing.jpg',
                        style: TextStyle(color: Colors.red),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'আম প্রক্রিয়াজাতকরণ: তাজা ফল থেকে মূল্য সংযোজিত পণ্যে রূপান্তর',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              '১. ধোয়া ও বাছাই:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'তাজা আম ভালোভাবে ধুয়ে নিতে হবে যাতে ময়লা, ধুলো এবং কীটনাশকের অবশিষ্টাংশ দূর হয়। তারপর ক্ষতিগ্রস্ত, রোগাক্রান্ত বা অতিপাকা আম বাদ দিয়ে বাছাই করতে হবে, কারণ এগুলো চূড়ান্ত পণ্যের মান নষ্ট করতে পারে।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '২. খোসা ছাড়ানো ও আঁটি বাদ দেওয়া:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'আম খোসা হাতে বা যান্ত্রিক পিলার দিয়ে ছাড়ানো হয়। সাধারণত খোসা ফেলে দেওয়া হয়। আঁটি বাদ দেওয়া বলতে মাঝখানের বড় বীজ অপসারণ করাকে বোঝায়, যা হাতে বা বিশেষ যন্ত্র দিয়ে করা যায়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৩. পাল্প নিষ্কাশন:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'খোসা ছাড়ানো ও আঁটি বাদ দেওয়া আম পাল্পার বা পাল্পিং মেশিনের মাধ্যমে চালিয়ে পাল্প বের করা হয়। পাল্প হলো অনেক আম পণ্যের মূল কাঁচামাল। নিশ্চিত করতে হবে পাল্প মসৃণ ও আঁশবিহীন।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৪. তাপ প্রয়োগ (পাস্তুরাইজেশন/স্টেরিলাইজেশন):',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'আমের পাল্প বা রসকে তাপ দিয়ে (পাস্তুরাইজেশন বা স্টেরিলাইজেশন) জীবাণুমুক্ত করা হয়, যাতে সংরক্ষণকাল বাড়ে ও নিরাপত্তা নিশ্চিত হয়। তাপমাত্রা ও সময় নির্ভর করে পণ্যের ধরন ও সংরক্ষণকাল চাহিদার উপর।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৫. নির্দিষ্ট পণ্য প্রক্রিয়াজাতকরণ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '  * **জুস/নেকটার:** পাল্পে পানি মিশিয়ে, চিনি ও কখনো সাইট্রিক অ্যাসিড যোগ করে, তাপ প্রয়োগ করে বোতলে ভরা হয়।\n  * **জ্যাম/জেলি:** পাল্পে চিনি ও পেকটিন মিশিয়ে নির্দিষ্ট ঘনত্বে রান্না করে জারে ভরা হয়।\n  * **আচার:** কাঁচা আম কেটে মসলা, তেল ও লবণ মিশিয়ে গাঁজন বা সংরক্ষণ করা হয়।\n  * **শুকনো টুকরা:** আম টুকরা করে সালফার ডাই অক্সাইডে (ঐচ্ছিক) ট্রিট করে সূর্যের আলো, গরম বাতাস বা ফ্রিজে শুকানো হয়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '৬. প্যাকেজিং ও সংরক্ষণ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'প্রক্রিয়াজাত আম পণ্য সঠিক, জীবাণুমুক্ত পাত্রে (ক্যান, বোতল, পাউচ) ভরে সংরক্ষণ করতে হবে। এগুলো ঠাণ্ডা, শুষ্ক স্থানে বা পণ্যের চাহিদা অনুযায়ী ফ্রিজে রাখতে হবে যাতে মান বজায় থাকে এবং নষ্ট না হয়।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

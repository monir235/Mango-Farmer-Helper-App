import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';



class GovernmentSchemesPage extends StatelessWidget {
  const GovernmentSchemesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সরকারি সাহায্য ও প্রকল্পসমূহ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'আম চাষিদের জন্য সরকারী সহায়তা',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            const Text(
              'বাংলাদেশ সরকার আম চাষিদের সহায়তার জন্য কয়েকটি উদ্যোগ নিয়েছে:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 12),

            const BulletPoint(text: '🌱 আম চাষিদের জন্য সার ও কীটনাশকের ছাড়।'),
            const BulletPoint(text: '📦 প্যাকেজিং ও শীতল সংরক্ষণ সুবিধার জন্য অনুদান।'),
            const BulletPoint(text: '📲 উৎপাদন বাড়াতে এবং রোগ কমাতে স্মার্ট কৃষি অ্যাপ সমর্থন।'),
            const BulletPoint(text: '🚚 আম বাজারে পরিবহনের জন্য ছাড়প্রাপ্ত পরিবহন।'),
            const BulletPoint(text: '📈 আধুনিক চাষাবাদ ও জৈব পদ্ধতি সম্পর্কে প্রশিক্ষণ কর্মসূচি।'),

            const SizedBox(height: 24),
            const Text(
              '🧭 চীনে আম রপ্তানি',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '২০২৪ সালে বাংলাদেশ চীনে আম রপ্তানি শুরু করেছে। প্রথম বছরে ১,২০০ মেট্রিক টনের বেশি আম রপ্তানি করা হয়েছে। এতে স্থানীয় চাষিদের আয়ের সুযোগ বৃদ্ধি পেয়েছে, আন্তর্জাতিক বাজারে প্রবেশ খুলেছে, এবং GAP (গুড এগ্রিকালচারাল প্র্যাকটিসেস) সার্টিফিকেশন উৎসাহিত হয়েছে।',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/export_crates.webp',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'সরকারি তত্ত্বাবধানে রপ্তানির জন্য আম প্যাকেটিং হচ্ছে।',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/mango_trade.webp',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'ঢাকায় অনুষ্ঠিত বাংলাদেশ-চীন আম রপ্তানি চুক্তি স্বাক্ষর অনুষ্ঠান।',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/mango_farmer.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'চীনের গুণগত মান মেনে আম রপ্তানির জন্য প্রস্তুত আম সংগ্রহ করছেন এক আম চাষি।',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Text(
              '👉 এই প্রকল্পগুলোর জন্য আবেদন করতে এবং রপ্তানি সনদপত্র ও প্রশিক্ষণ সুবিধা পেতে আপনার নিকটস্থ কৃষি সম্প্রসারণ অফিসে যান।',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              '🏥 সারাদেশে উপজেলা স্বাস্থ্য কমপ্লেক্স',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'বাংলাদেশে বর্তমানে মোট ৪৯৫টি উপজেলা স্বাস্থ্য কমপ্লেক্স রয়েছে যা কৃষকদের স্বাস্থ্য সহায়তা প্রদান করে। চাষাবাদে ব্যবহৃত রাসায়নিক ও কীটনাশকের প্রভাবজনিত সমস্যার জন্য এগুলো তাৎক্ষণিক চিকিৎসা প্রদান করে থাকে।',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const Text(
              '👉 এই প্রকল্পগুলোর জন্য আবেদন করতে এবং রপ্তানি সনদপত্র ও প্রশিক্ষণ সুবিধা পেতে আপনার নিকটস্থ কৃষি সম্প্রসারণ অফিসে যান।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              '🌐 অনলাইন সহায়তা:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            InkWell(
              onTap: () async {
                final url = 'https://www.dae.gov.bd/';
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('ওয়েবসাইটটি খোলা যায়নি: $url')),
                  );
                }
              },
              child: const Text(
                'কৃষি সম্প্রসারণ অধিদপ্তরের ওয়েবসাইট দেখুন',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '🌐 গুরুত্বপূর্ণ সরকারি ও কৃষি সহায়তা লিংক',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            LinkTile(
              title: 'কৃষি তথ্য সার্ভিস (AIS)',
              url: 'http://www.ais.gov.bd/',
              icon: Icons.agriculture,
            ),
            LinkTile(
              title: 'কৃষি সম্প্রসারণ অধিদপ্তর (DAE)',
              url: 'http://www.dae.gov.bd/',
              icon: Icons.home_repair_service,
            ),
            LinkTile(
              title: 'ডিজিটাল বাংলাদেশ গেটওয়ে (জাতীয় তথ্য বাতায়ন)',
              url: 'http://www.bangladesh.gov.bd/',
              icon: Icons.language,
            ),
            LinkTile(
              title: 'বাংলাদেশ কৃষি গবেষণা ইনস্টিটিউট (BARI)',
              url: 'http://www.bari.gov.bd/',
              icon: Icons.science,
            ),
            ListTile(
              leading: const Icon(Icons.link, color: Colors.blue),
              title: const Text(
                '👨‍🌾 কৃষকদের সহায়তার ওয়েবসাইট',
                style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
              ),
              onTap: () async {
                final url = 'https://www.dae.gov.bd/'; // Replace with desired URL
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('লিংক খোলা যায়নি: $url')),
                  );
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class LinkTile extends StatelessWidget {
  final String title;
  final String url;
  final IconData icon;

  const LinkTile({
    required this.title,
    required this.url,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('লিংক খুলুন: $url')),
          );
          // Optional: You can use url_launcher package to actually open the link
        },
        child: Row(
          children: [
            Icon(icon, color: Colors.green.shade700),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

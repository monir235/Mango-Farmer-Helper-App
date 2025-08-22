import 'package:flutter/material.dart';

class SoilHealthCheckerPage extends StatefulWidget {
  const SoilHealthCheckerPage({super.key});

  @override
  State<SoilHealthCheckerPage> createState() => _SoilHealthCheckerPageState();
}

class _SoilHealthCheckerPageState extends State<SoilHealthCheckerPage> {
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _moistureController = TextEditingController();

  String _advice = '';

  void _checkSoilHealth() {
    final double? ph = double.tryParse(_phController.text);
    final double? moisture = double.tryParse(_moistureController.text);

    if (ph == null || moisture == null) {
      setState(() {
        _advice = 'অনুগ্রহ করে সঠিক তথ্য দিন।';
      });
      return;
    }

    String result = '';

    // pH analysis
    if (ph < 5.5) {
      result += 'মাটি খুবই অম্ল, চুন প্রয়োগ করুন।\n';
    } else if (ph >= 5.5 && ph <= 7.5) {
      result += 'মাটির pH আদর্শ, আমের জন্য ভালো।\n';
    } else if (ph >= 7.6 && ph <= 14) {
      result += 'মাটি অতীভ ক্ষারীয়, অনুগ্রহ করে তেতুল গাছের ডাল প্রয়োগ করুন।\n';
    } else {
      result += 'দয়া করে সঠিক তথ্য দিন।\n';
    }


    // Moisture analysis
    if (moisture < 20) {
      result += 'মাটির আর্দ্রতা কম, সেচ দেওয়া দরকার।';
    } else if (moisture >= 20 && moisture <= 60) {
      result += 'মাটির আর্দ্রতা ঠিক আছে।';
    } else {
      result += 'মাটি অতিরিক্ত ভেজা, নিষ্কাশনের ব্যবস্থা করুন।';
    }

    setState(() {
      _advice = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('মাটির স্বাস্থ্য চেক করুন'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'মাটির তথ্য দিন:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'pH মান',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _moistureController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'আর্দ্রতার পরিমাণ (%)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkSoilHealth,
              child: const Text('পরামর্শ নিন'),
            ),
            const SizedBox(height: 20),
            Text(
              _advice,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Divider(),
            const Text(
              'মাটির pH মাপার উপায়',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/ph_meter.jpg'),
            const SizedBox(height: 10),
            const Text(
              '১. pH মিটারটি চালু করুন।\n'
                  '২. সেন্সরটি ভেজা মাটিতে ঢুকিয়ে দিন।\n'
                  '৩. ৩০ সেকেন্ড অপেক্ষা করুন এবং পরিমাপটি পড়ে নিন।',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              'মাটির আর্দ্রতা মাপার উপায়',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/moisture.webp'),
            const SizedBox(height: 10),
            const Text(
              '১. আর্দ্রতা মিটারটি মাটির ভেতরে ঢুকিয়ে দিন।\n'
                  '২. স্কেলে থাকা মান দেখে নিন (শুকনো/আদর্শ/ভেজা)।\n'
                  '৩. বারবার ব্যবহার করার আগে সেন্সর পরিষ্কার করুন।',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

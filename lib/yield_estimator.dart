import 'package:flutter/material.dart';

class YieldEstimatorPage extends StatefulWidget {
  const YieldEstimatorPage({super.key});

  @override
  State<YieldEstimatorPage> createState() => _YieldEstimatorPageState();
}

class _YieldEstimatorPageState extends State<YieldEstimatorPage> {
  String? selectedAge;
  String? selectedType;
  double? area;
  double? estimatedYield;

  final ageOptions = ['1-3 years', '4-7 years', '8+ years'];
  final typeOptions = ['ফজলি', 'ল্যাংড়া', 'আম্রপালি'];

  void calculateYield() {
    if (selectedAge == null || selectedType == null || area == null) return;

    double baseYield;
    switch (selectedAge) {
      case '1-3 years':
        baseYield = 50;
        break;
      case '4-7 years':
        baseYield = 150;
        break;
      case '8+ years':
        baseYield = 300;
        break;
      default:
        baseYield = 0;
    }

    // Adjust yield based on type (example factors)
    double typeFactor = {
      'ফজলি': 1.0,
      'ল্যাংড়া': 0.9,
      'আম্রপালি': 1.2,
    }[selectedType] ?? 1.0;

    setState(() {
      estimatedYield = baseYield * typeFactor * area!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('উৎপাদন পূর্বানুমান')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('গাছের বয়স:', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedAge,
              isExpanded: true,
              hint: const Text('বয়স নির্বাচন করুন'),
              items: ageOptions.map((age) {
                return DropdownMenuItem(value: age, child: Text(age));
              }).toList(),
              onChanged: (value) => setState(() => selectedAge = value),
            ),
            const SizedBox(height: 20),

            const Text('আমের ধরন:', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedType,
              isExpanded: true,
              hint: const Text('ধরন নির্বাচন করুন'),
              items: typeOptions.map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
              onChanged: (value) => setState(() => selectedType = value),
            ),
            const SizedBox(height: 20),

            const Text('এলাকার পরিমাণ (ডেসিমাল):', style: TextStyle(fontSize: 18)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'উদাহরণ: 5',
              ),
              onChanged: (value) {
                setState(() {
                  area = double.tryParse(value);
                });
              },
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: calculateYield,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('উৎপাদন হিসাব করুন'),
            ),
            const SizedBox(height: 20),

            if (estimatedYield != null)
              Text(
                'আনুমানিক উৎপাদন: ${estimatedYield!.toStringAsFixed(2)} কেজি',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MarketPricePage extends StatefulWidget {
  const MarketPricePage({super.key});

  @override
  State<MarketPricePage> createState() => _MarketPricePageState();
}

class _MarketPricePageState extends State<MarketPricePage> {
  final String apiBaseUrl = "http://192.168.0.150/farmer_api";

  // Updated fetch function to handle wrapped JSON
  Future<List<Map<String, dynamic>>> _fetchMangoPrices() async {
    try {
      final response = await http.get(Uri.parse('$apiBaseUrl/mangoprice.php'));
      print('Fetch status: ${response.statusCode}');
      print('Fetch body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse is Map && jsonResponse.containsKey('data')) {
          return List<Map<String, dynamic>>.from(jsonResponse['data']);
        } else if (jsonResponse is List) {
          return List<Map<String, dynamic>>.from(jsonResponse);
        } else {
          throw Exception("Unexpected JSON structure");
        }
      } else {
        throw Exception('ডেটা লোড করা যায়নি');
      }
    } catch (e) {
      throw Exception('ডেটা আনতে সমস্যা হয়েছে: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('বাজার মূল্য')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'আমের বিভিন্ন জাতের বর্তমান বাজার মূল্য',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'প্রতিদিন দেশের প্রধান ফলের বাজার থেকে হালনাগাদ করা হয়। বর্তমান বাজার মূল্য জানা থাকলে কখন আম বিক্রি করা উপযুক্ত এবং কোন জাত বেশি লাভজনক তা নির্ধারণে সহায়তা করে।',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/market_price.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              'মূল্য তালিকা:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _fetchMangoPrices(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('ভুল হয়েছে: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('কোনো ডেটা পাওয়া যায়নি');
                } else {
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text('জাত')),
                      DataColumn(label: Text('মূল্য (৳/কেজি)')),
                    ],
                    rows: snapshot.data!
                        .map(
                          (mango) => DataRow(
                        cells: [
                          DataCell(Text(
                              mango['mango_name']?.toString() ??
                                  mango['name'] ??
                                  "Unknown")),
                          DataCell(Text(
                              mango['price_per_kg']?.toString() ??
                                  mango['price'] ??
                                  "-")),
                        ],
                      ),
                    )
                        .toList(),
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

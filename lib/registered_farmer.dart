import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisteredFarmerPage extends StatefulWidget {
  const RegisteredFarmerPage({super.key});

  @override
  State<RegisteredFarmerPage> createState() => _RegisteredFarmerPageState();
}

class _RegisteredFarmerPageState extends State<RegisteredFarmerPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _mobileController = TextEditingController();

  // ✅ Base URL to your backend folder in XAMPP
  final String apiBaseUrl = "http://192.168.0.150/farmer_api";

  Future<void> _registerFarmer() async {
    final response = await http.post(
      Uri.parse('$apiBaseUrl/addnewfarmer.php'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": _nameController.text,
        "address": _addressController.text,
        "mobile": _mobileController.text,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('নিবন্ধন সফল হয়েছে!')),
        );
        _nameController.clear();
        _addressController.clear();
        _mobileController.clear();
        setState(() {}); // Refresh list
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ত্রুটি: ${jsonResponse['message']}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('সার্ভার সংযোগ ব্যর্থ হয়েছে')),
      );
    }
  }

  Future<List<Map<String, dynamic>>> _fetchFarmers() async {
    final response = await http.get(Uri.parse('$apiBaseUrl/getnewfarmer.php'));

    print('Fetch status: ${response.statusCode}');
    print('Fetch body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        List data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } catch (e) {
        throw Exception('ডেটা পার্স করতে সমস্যা হয়েছে: $e');
      }
    } else {
      throw Exception('ডেটা লোড করা যায়নি');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('নিবন্ধিত কৃষক')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'নাম'),
                    validator: (value) => value!.isEmpty ? 'নাম দিন' : null,
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'ঠিকানা'),
                    validator: (value) => value!.isEmpty ? 'ঠিকানা দিন' : null,
                  ),
                  TextFormField(
                    controller: _mobileController,
                    decoration: const InputDecoration(labelText: 'মোবাইল নম্বর'),
                    keyboardType: TextInputType.phone,
                    validator: (value) => value!.isEmpty ? 'মোবাইল নম্বর দিন' : null,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _registerFarmer();
                      }
                    },
                    child: const Text('নিবন্ধন করুন'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              'নিবন্ধিত কৃষকদের তালিকা',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _fetchFarmers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('ভুল হয়েছে: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('কোনো কৃষক নিবন্ধিত নয়');
                } else {
                  return Column(
                    children: snapshot.data!.map((farmer) {
                      return Card(
                        child: ListTile(
                          title: Text(farmer['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ঠিকানা: ${farmer['address']}'),
                              Text('মোবাইল: ${farmer['mobile']}'),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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

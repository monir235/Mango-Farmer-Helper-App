import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DifferentMangoesPage extends StatefulWidget {
  const DifferentMangoesPage({super.key});

  @override
  State<DifferentMangoesPage> createState() => _DifferentMangoesPageState();
}

class _DifferentMangoesPageState extends State<DifferentMangoesPage> {
  final List<Map<String, String>> mangoTypes = [
    {
      'name': 'কেন্ট আম',
      'image': 'assets/kentmango.webp',
      'features': 'বড়, আকারে ডিম্বাকৃতি, মসৃণ, সবুজ-হলুদ চামড়া...'
    },
    {
      'name': 'ফজলি আম',
      'image': 'assets/fazli.jpg',
      'features': 'খুব বড়, লম্বাকৃতির আম...'
    },
    // Add other static mango types as needed
  ];

  List<dynamic> fetchedMangoes = []; // Mangoes from database
  File? _pickedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMangoesFromDB();
  }

  // Pick image from device
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedImage = File(picked.path);
      });
    }
  }

  // Upload image + details to backend
  Future<void> uploadMango() async {
    if (_pickedImage == null || _nameController.text.isEmpty || _detailsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter name, details, and select an image")),
      );
      return;
    }

    final uri = Uri.parse("http://192.168.0.103/farmer_api/upload_mango.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = _nameController.text;
    request.fields['details'] = _detailsController.text;
    request.files.add(await http.MultipartFile.fromPath('image', _pickedImage!.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Mango uploaded successfully")),
      );
      _nameController.clear();
      _detailsController.clear();
      setState(() {
        _pickedImage = null;
      });
      fetchMangoesFromDB();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to upload mango")),
      );
    }
  }

  // Fetch mangoes from DB
  Future<void> fetchMangoesFromDB() async {
    final url = Uri.parse("http://192.168.0.103/farmer_api/get_mangoes.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        fetchedMangoes = json.decode(response.body);
      });
    } else {
      print("Failed to fetch mangoes: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('বিভিন্ন ধরনের আম'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'বিভিন্ন ধরনের আম এবং তাদের বিশেষ বৈশিষ্ট্য।',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 20),

            // Static mango list
            ...mangoTypes.map((mango) {
              return buildMangoCard(
                mango['image']!,
                mango['name']!,
                mango['features']!,
              );
            }).toList(),

            const Divider(thickness: 2),
            const SizedBox(height: 10),
            const Text("নতুন আমের ছবি যুক্ত করুন", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "আমের নাম",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(
                labelText: "আমের বিবরণ দিন",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            if (_pickedImage != null)
              Image.file(_pickedImage!, height: 150)
            else
              const Text("কোন ছবি বাছাই করা হয়নি"),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text("ছবি বাছাই করুন"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: uploadMango,
              child: const Text("আপলোড করুন"),
            ),

            const Divider(thickness: 2),
            const SizedBox(height: 10),
            const Text("নতুন যুক্ত করা আমের তালিকা", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            ...fetchedMangoes.map((m) {
              return buildMangoCard(
                m['image_url'] ?? '',
                m['name'] ?? 'Unknown',
                m['details'] ?? '',
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildMangoCard(String image, String name, String details) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: image.startsWith("http")
                    ? Image.network(image, height: 180, fit: BoxFit.cover)
                    : Image.asset(image, height: 180, fit: BoxFit.cover),
              ),
              const SizedBox(height: 15),
              Text(
                name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 10),
              Text(details, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

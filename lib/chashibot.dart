import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChashiBotPage extends StatefulWidget {
  const ChashiBotPage({super.key});

  @override
  State<ChashiBotPage> createState() => _ChashiBotPageState();
}

class _ChashiBotPageState extends State<ChashiBotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  // 🔑 তোমার API Key এখানে বসাও (কোডে হার্ডকোড না করে .env বা server ব্যবহার করা ভালো)
  final String apiKey = "AIzaSyDHPY80OEeqDkg_mP13Qe6L7DYiB2dswyo";

  Future<void> sendMessage(String message) async {
    setState(() {
      _messages.add({"role": "user", "text": message});
      _isLoading = true;
    });

    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey",
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": "বাংলায় উত্তর দাও: $message"}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final reply = data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"] ??
          "কোনো উত্তর পাওয়া যায়নি।";

      setState(() {
        _messages.add({"role": "bot", "text": reply});
      });
    } else {
      setState(() {
        _messages.add({"role": "bot", "text": "ত্রুটি হয়েছে, আবার চেষ্টা করুন।"});
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("চাষি বট"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg["role"] == "user";
                return Container(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.green[300] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg["text"] ?? "",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "আপনার প্রশ্ন লিখুন...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      _controller.clear();
                      sendMessage(text);
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

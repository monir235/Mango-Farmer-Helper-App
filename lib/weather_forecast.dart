// weather_forecast.dart
import 'package:flutter/material.dart';

class WeatherForecastPage extends StatelessWidget {
  const WeatherForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আবহাওয়ার পূর্বাভাস'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'আমের চাষের জন্য ৭ দিনের আবহাওয়ার পূর্বাভাস',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Text(
              'সফল আম চাষের জন্য আবহাওয়ার ধরণ বোঝা অত্যন্ত গুরুত্বপূর্ণ। '
                  'এই পূর্বাভাস আপনাকে সেচ, ফসল সংগ্রহ এবং পোকামাকড় নিয়ন্ত্রণে সহায়তা করবে।',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Weather graph/image slot
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/mango_togo.png', // <-- Path to your image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Text(
                        'ছবি পাওয়া যায়নি: assets/mango_climate.webp\n(assets ফোল্ডার এবং pubspec.yaml চেক করুন)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView(
                children: const [
                  WeatherDay(
                    day: 'সোমবার',
                    condition: 'রৌদ্রজ্জ্বল',
                    tempMin: 25,
                    tempMax: 35,
                    humidity: 60,
                  ),
                  WeatherDay(
                    day: 'মঙ্গলবার',
                    condition: 'আংশিক মেঘলা',
                    tempMin: 24,
                    tempMax: 33,
                    humidity: 65,
                  ),
                  WeatherDay(
                    day: 'বুধবার',
                    condition: 'বৃষ্টি',
                    tempMin: 22,
                    tempMax: 29,
                    humidity: 80,
                  ),
                  WeatherDay(
                    day: 'বৃহস্পতিবার',
                    condition: 'বজ্রসহ বৃষ্টি',
                    tempMin: 21,
                    tempMax: 28,
                    humidity: 85,
                  ),
                  WeatherDay(
                    day: 'শুক্রবার',
                    condition: 'মেঘলা',
                    tempMin: 23,
                    tempMax: 30,
                    humidity: 70,
                  ),
                  WeatherDay(
                    day: 'শনিবার',
                    condition: 'রৌদ্রজ্জ্বল',
                    tempMin: 26,
                    tempMax: 34,
                    humidity: 55,
                  ),
                  WeatherDay(
                    day: 'রবিবার',
                    condition: 'পরিষ্কার',
                    tempMin: 25,
                    tempMax: 33,
                    humidity: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherDay extends StatelessWidget {
  final String day;
  final String condition;
  final int tempMin;
  final int tempMax;
  final int humidity;

  const WeatherDay({
    super.key,
    required this.day,
    required this.condition,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(_getWeatherIcon(condition), color: Colors.orange),
        title: Text(day),
        subtitle: Text(condition),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ন্যূনতম: $tempMin°C'),
            Text('সর্বোচ্চ: $tempMax°C'),
            Text('আর্দ্রতা: $humidity%'),
          ],
        ),
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'রৌদ্রজ্জ্বল':
        return Icons.wb_sunny;
      case 'আংশিক মেঘলা':
        return Icons.cloud_queue;
      case 'বৃষ্টি':
      case 'বজ্রসহ বৃষ্টি':
        return Icons.grain;
      case 'মেঘলা':
        return Icons.cloud;
      case 'পরিষ্কার':
        return Icons.wb_sunny;
      default:
        return Icons.help_outline;
    }
  }
}

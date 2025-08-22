import 'package:flutter/material.dart';
import 'package:mangoapp/cultivation.dart';
import 'package:mangoapp/fruit_collection.dart';
import 'package:mangoapp/storage.dart';
import 'package:mangoapp/processing.dart';
import 'package:mangoapp/weather_forecast.dart';
import 'package:mangoapp/pest_diagnosis.dart';
import 'package:mangoapp/market_price.dart';
import 'package:mangoapp/government_schemes.dart';
import 'package:mangoapp/soil_health_checker.dart';
import 'package:mangoapp/registered_farmer.dart';
import 'package:mangoapp/chashibot.dart';



void main() {
  runApp(const MangoFarmerApp());
}

class MangoFarmerApp extends StatelessWidget {
  const MangoFarmerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'আমের কৃষক সহকারী',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 4,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonSize = 50.00;

    return Scaffold(
      appBar: AppBar(
        title: const Text('আমের কৃষক সহকারী'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background_mango.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    'স্বাগতম, আমচাষী!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        _buildSquareButton(context, 'চাষাবাদ', Icons.agriculture, const CultivationPage(), buttonSize),
                        _buildSquareButton(context, 'সংগ্রহ', Icons.shopping_basket, const FruitCollectionPage(), buttonSize),
                        _buildSquareButton(context, 'সংরক্ষণ', Icons.store, const StoragePage(), buttonSize),
                        _buildSquareButton(context, 'প্রক্রিয়াকরণ', Icons.local_shipping, const ProcessingPage(), buttonSize),
                        _buildSquareButton(context, 'আবহাওয়া', Icons.cloud, const WeatherForecastPage(), buttonSize),
                        _buildSquareButton(context, 'পোকামাকড়', Icons.bug_report, const PestDiagnosisPage(), buttonSize),
                        _buildSquareButton(context, 'বাজার', Icons.attach_money, const MarketPricePage(), buttonSize),
                        _buildSquareButton(context, 'সরকারি স্কিম', Icons.account_balance, const GovernmentSchemesPage(), buttonSize),
                        _buildSquareButton(context, 'মাটির স্বাস্থ্য', Icons.grass, const SoilHealthCheckerPage(), buttonSize),
                        _buildSquareButton(context, 'নিবন্ধিত কৃষক', Icons.person_add, const RegisteredFarmerPage(), buttonSize),
                        _buildSquareButton(context, 'চাষি বট', Icons.chat, const ChashiBotPage(), buttonSize),

                      ],


                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareButton(
      BuildContext context, String label, IconData icon, Widget page, double size) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.green.shade700.withOpacity(0.85),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8D6E63), // بني فاتح
              Color(0xFF4E342E), // بني غامق
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.pets_rounded,
              size: 150,
              color: Color(0xFFFFF3E0), // أبيض مائل للبيج
            ),

            SizedBox(height: 25),

            Text(
              "Animal Sounds",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFF3E0),
                letterSpacing: 1.3,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "Anamles pictiure and sound",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFD7CCC8),
              ),
            ),

            SizedBox(height: 40),

            CircularProgressIndicator(
              color: Color(0xFFFFF3E0),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}

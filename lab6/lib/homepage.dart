import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lab6/animalsData.dart';
import 'package:lab6/moreinfo.dart';

class HomePage extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  void PlaySound(String path) async {
    await player.stop();
    await player.play(AssetSource(path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3ECE7), // خلفية بيج فاتح
      appBar: AppBar(
        backgroundColor: const Color(0xFF6D4C41), // بني غامق
        title: const Text(
          "Animal Sounds",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Card(
            elevation: 4,
            color: const Color(0xFFFFF8F3), // لون الكرت
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Info(animals: animal),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        animal.image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animal.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4E342E), // بني غامق للنص
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Click to listen",
                          style: TextStyle(
                            color: Color(0xFF8D6E63), // بني فاتح
                          ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () => PlaySound(animal.sound),
                    child: const Icon(
                      Icons.play_circle_fill,
                      color: Color(0xFF6D4C41), // بني للأيقونة
                      size: 42,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

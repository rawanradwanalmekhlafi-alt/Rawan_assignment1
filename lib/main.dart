import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DesignScreen(),
    );
  }
}

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 40, bottom: 40),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFADD8E6).withOpacity(0.4),
              borderRadius: BorderRadius.circular(0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.95,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildTopButtonsRow(),
                const SizedBox(height: 30),
                _buildFancySection(),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Info Cards',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                _buildInfoCardsRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildTopButton(label: 'A', color: const Color(0xFFE53935)),
        _buildTopButton(label: 'B', color: const Color(0xFFFFB300)),
        _buildTopButton(label: 'C', color: const Color(0xFFFFEB3B)),
      ],
    );
  }

  Widget _buildTopButton({required String label, required Color color}) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: label == 'C' ? Colors.black87 : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildFancySection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD3C5E8).withOpacity(0.9),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Fancy Section',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFancyCard(number: 1, color: const Color(0xFF8E24AA)),
              _buildFancyCard(number: 2, color: const Color(0xFF8E24AA)),
              _buildFancyCard(number: 3, color: const Color(0xFF8E24AA)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFancyCard(number: 4, color: const Color(0xFFAB47BC)),
              _buildFancyCard(number: 5, color: const Color(0xFFAB47BC)),
              _buildFancyCard(number: 6, color: const Color(0xFFAB47BC)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFancyCard({required int number, required Color color}) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _buildInfoCardsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildInfoCard(
          count: '23',
          label: 'Active',
          numberColor: const Color(0xFF4CAF50),
        ),
        _buildInfoCard(
          count: '15',
          label: 'Pending',
          numberColor: const Color(0xFFFFC107),
        ),
        _buildInfoCard(
          count: '7',
          label: 'Completed',
          numberColor: const Color(0xFF4CAF50),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String count,
    required String label,
    required Color numberColor,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12, width: 0.5),
        ),
        child: Column(
          children: <Widget>[
            Text(
              count,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: numberColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
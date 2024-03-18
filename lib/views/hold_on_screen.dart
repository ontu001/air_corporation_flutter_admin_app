import 'package:flutter/material.dart';

class HoldOnScreen extends StatefulWidget {
  const HoldOnScreen({super.key});

  @override
  State<HoldOnScreen> createState() => _HoldOnScreenState();
}

class _HoldOnScreenState extends State<HoldOnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hold on'),
      ),
      body:  const Center(child:  Text('Hold on')),
    );
  }
}
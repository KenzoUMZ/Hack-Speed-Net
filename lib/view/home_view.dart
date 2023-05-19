import 'package:flutter/material.dart';
import 'package:hack_speed_meter/view/control_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(150),
        height: double.infinity,
        width: double.infinity,
        child: Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(2),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black),
            child: Center(
              child: TextButton(
                child: const Text(
                  'ENTRAR',
                  style: TextStyle(color: Colors.green, fontSize: 24),
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ControlPageView())),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

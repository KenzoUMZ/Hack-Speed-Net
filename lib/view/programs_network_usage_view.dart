import 'package:flutter/material.dart';
import 'dart:async';

import '../model/program_consume.dart';
import '../services/network_service.dart';

class ProgramsNetworkUsageView extends StatefulWidget {
  const ProgramsNetworkUsageView({super.key, required this.streamController});
  final StreamController<List<dynamic>> streamController;
  @override
  State<ProgramsNetworkUsageView> createState() =>
      _ProgramsNetworkUsageViewState();
}

class _ProgramsNetworkUsageViewState extends State<ProgramsNetworkUsageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Socket JSON Example'),
      ),
      body: Center(
        child: StreamBuilder<List<dynamic>>(
          stream: widget.streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> jsonData = snapshot.data!;
              List models = programConsumeService(jsonData);

              return ListView.builder(
                itemCount: models.length,
                itemBuilder: (context, index) {
                  ProgramConsume exampleModel = models[index];
                  return ListTile(
                    title: Text(
                      'Program: ${exampleModel.name}',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'Speed: ${exampleModel.downloadSpeed}',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

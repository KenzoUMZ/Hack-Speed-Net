import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hack_speed_meter/view/programs_network_usage_view.dart';
import 'package:hack_speed_meter/view/speed_test_view.dart';

/// Flutter code sample for [PageView].

class ControlPageView extends StatefulWidget {
  const ControlPageView({super.key});

  @override
  State<ControlPageView> createState() => _ControlPageViewState();
}

class _ControlPageViewState extends State<ControlPageView> {
  Socket? socket;
  final StreamController<List<dynamic>> _streamController =
      StreamController<List<dynamic>>.broadcast();
  List<dynamic> receivedData = [];

  @override
  void initState() {
    super.initState();

    connectToProgramsNetworkUsageSocket();
  }

  @override
  void dispose() {
    socket?.destroy();
    _streamController.close();
    super.dispose();
  }

  Future<void> connectToProgramsNetworkUsageSocket() async {
    try {
      socket = await Socket.connect('localhost', 8080);
      socket!.listen((List<int> data) {
        String jsonData = utf8.decode(data);
        setState(() {
          receivedData = jsonDecode(jsonData);
        });
        _streamController.sink.add(receivedData);
      });
    } catch (e) {
      print('Socket connection error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ProgramsNetworkUsageView(
        streamController: _streamController,
      ),
      const SpeedTestView()
    ];

    final PageController controller = PageController();
    return PageView(

        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: controller,
        children: pages);
  }
}

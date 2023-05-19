import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hack_speed_meter/model/network_statics.dart';

class SpeedTestView extends StatefulWidget {
  const SpeedTestView({super.key});

  @override
  State<SpeedTestView> createState() => _SpeedTestViewState();
}

class _SpeedTestViewState extends State<SpeedTestView>
    with AutomaticKeepAliveClientMixin {
  List<Socket> sockets = [];
  late OthersStats othersStats;
  late HttpsStats httpsStats;
  late Item item;
  late Network network;

  @override
  void initState() {
    super.initState();
    initializeSockets();
    network = Network();
    othersStats = OthersStats();
    httpsStats = HttpsStats();
    item = Item();
    updateData();
  }

  void initializeSockets() async {
    for (int port in [50000, 50001, 50002]) {
      try {
        Socket socket = await Socket.connect('localhost', port);
        sockets.add(socket);
        handleSocketConnection(socket);
      } catch (e) {
        print('Error connecting to socket: $e');
      }
    }
  }

  void handleSocketConnection(Socket socket) {
    socket.listen((data) {
      var jsonString = String.fromCharCodes(data);
      var jsonData = jsonDecode(jsonString);
      updateObjects(jsonData);
    }, onError: (error) {
      print('Socket error: $error');
    });
  }

  @override
  void dispose() {
    for (Socket socket in sockets) {
      socket.destroy();
    }
    super.dispose();
  }

  Future<void> updateData() async {
    for (Socket socket in sockets) {
      handleSocketConnection(socket);
      handleSocketConnection(socket);
      handleSocketConnection(socket);
    }
  }

  void updateObjects(Map<String, dynamic> jsonData) {
    print(jsonData);
    if (jsonData.containsKey('others')) {
      setState(() {
        othersStats = OthersStats.fromJson(jsonData['others']);
      });
    } else if (jsonData.containsKey('https')) {
      setState(() {
        httpsStats = HttpsStats.fromJson(jsonData['https']);
      });
    }

    if (jsonData.containsKey('16272')) {
      setState(() {
        item = Item.fromJson(jsonData['16272']);
      });
    } else if (jsonData.containsKey('20232')) {
      setState(() {
        item = Item.fromJson(jsonData['20232']);
      });
    }

    if (jsonData.containsKey('0')) {
      setState(() {
        network = Network.fromJson(jsonData['0']);
      });
    } else if (jsonData.containsKey('1')) {
      setState(() {
        network = Network.fromJson(jsonData['1']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          child: Column(children: [
            Text(
              'Network: ${network.download}',
            ),
            Text(
              'Item: ${item.download}',
              style: const TextStyle(color: Colors.green),
            ),
            Text('Https: ${httpsStats.download}'),
            Text('DownloadSpeed: ${othersStats.download}'),
          ]),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

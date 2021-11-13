import 'package:flutter/material.dart';
import 'package:flutter_network_connectivity/network_aware_widget.dart';
import 'package:flutter_network_connectivity/network_status_service.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Network Aware App"),
      ),
      body: StreamProvider<NetworkStatus>(
        initialData: NetworkStatus.Offline,
        create: (context) =>
            NetworkStatusService().networkStatusController.stream,
        child: NetworkAwareWidget(
          onlineChild: const Center(
            child: Text(
              "I am online",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
          offlineChild: Center(
            child: Text(
              "No internet connection!",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}

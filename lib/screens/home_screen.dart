import 'package:flutter/material.dart';
import 'package:ticket_track/widgets/home_ticket.dart';
import '../providers/alert_provider.dart';
import 'new_ticket.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AlertProvider(),
      child: Scaffold(
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: HomeTicket(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewTicket()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
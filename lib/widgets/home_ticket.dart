import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_track/widgets/ticket_card.dart';
import '../providers/ticket_provider.dart';

class HomeTicket extends StatelessWidget {
  const HomeTicket({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context);

    ticketProvider.loadTickets();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0, 
          children: ticketProvider.tickets.map((ticket) {
            return TicketCard(
              ticket: ticket,
              colorKey: ticket.situation,
              textColor: Colors.black,
            );
          }).toList(),
        ),
      ),
    );
  }
}

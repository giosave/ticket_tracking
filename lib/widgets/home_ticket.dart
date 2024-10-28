import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_track/models/ticket.dart';
import 'package:ticket_track/widgets/ticket_card.dart';
import '../providers/ticket_provider.dart';
import 'package:ticket_track/models/status_ticket.dart';
import 'package:ticket_track/services/status_ticket_service.dart';

class HomeTicket extends StatefulWidget {
  const HomeTicket({super.key});

  @override
  _HomeTicketState createState() => _HomeTicketState();
}

class _HomeTicketState extends State<HomeTicket> {
  String? _selectedOption;
  final StatusTicketService _statusTicketService = StatusTicketService();
  late List<StatusTicket> _statusOptions;

  @override
  void initState() {
    super.initState();
    Provider.of<TicketProvider>(context, listen: false).loadTickets();
    _statusOptions = _statusTicketService.getStatusTickets();
  }

  List<Ticket> _filterTickets(TicketProvider ticketProvider) {
    return _selectedOption == null || _selectedOption == 'Todos'
        ? ticketProvider.tickets
        : ticketProvider.tickets.where((ticket) {
            return ticket.situation == _selectedOption;
          }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildDropdown(),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<TicketProvider>(
                builder: (context, ticketProvider, child) {
                  final filteredTickets = _filterTickets(ticketProvider);
                  return _buildTicketList(filteredTickets);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton<String>(
          value: _selectedOption,
          items: _statusOptions.map((StatusTicket status) {
            return DropdownMenuItem<String>(
              value: status.id,
              child: Text(status.name),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue;
            });
          },
          hint: const Text('Selecciona una opción'),
        ),
      ],
    );
  }

  Widget _buildTicketList(List<Ticket> tickets) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: tickets.map((ticket) {
          return TicketCard(
            ticket: ticket,
            colorKey: ticket.situation,
            textColor: Colors.black,
          );
        }).toList(),
      ),
    );
  }
}

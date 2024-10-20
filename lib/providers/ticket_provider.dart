import 'package:flutter/material.dart';
import '../models/ticket.dart';
import '../services/ticket_service.dart';

class TicketProvider with ChangeNotifier {
  List<Ticket> _tickets = [];
  final TicketService _ticketService = TicketService();

  List<Ticket> get tickets => _tickets;

  void loadTickets() {
    _tickets = _ticketService.getTicketsFakes();
    notifyListeners();
  }
}

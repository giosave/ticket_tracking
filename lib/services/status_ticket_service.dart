import '../models/status_ticket.dart';

class StatusTicketService {
  List<StatusTicket> getStatusTickets() {
    return [
      StatusTicket(id: 'Todos', name: 'Todos'),
      StatusTicket(id: 'Completado', name: 'Completado'),
      StatusTicket(id: 'En Proceso', name: 'En Proceso'),
      StatusTicket(id: 'Pendiente', name: 'Pendiente'),
    ];
  }
}
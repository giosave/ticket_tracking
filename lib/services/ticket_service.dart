import '../models/ticket.dart';

class TicketService {
  List<Ticket> getTicketsFakes() {
    return [
      Ticket(
        folio: 'F12345',
        date: '2023-10-01',
        origin: 'Email',
        site: 'Oficina Central',
        client: 'Cliente A',
        situation: 'Pendiente',
        level: 'Alto',
        status: 'Abierto',
        responsiblePerson: 'Juan Pérez',
        department: 'Soporte Técnico',
        assignedPerson: 'Ana Gómez',
        commitmentDate: '2023-10-05',
        steps: 3,
        days: 2,
        comments: 'Requiere atención urgente',
      ),
      Ticket(
        folio: 'F67890',
        date: '2023-10-02',
        origin: 'Teléfono',
        site: 'Sucursal Norte',
        client: 'Cliente B',
        situation: 'En Proceso',
        level: 'Medio',
        status: 'En Progreso',
        responsiblePerson: 'Carlos López',
        department: 'Atención al Cliente',
        assignedPerson: 'María Fernández',
        commitmentDate: '2023-10-06',
        steps: 2,
        days: 1,
        comments: 'Cliente solicitó seguimiento',
      ),
      Ticket(
        folio: 'F11223',
        date: '2023-10-03',
        origin: 'Chat',
        site: 'Sucursal Sur',
        client: 'Cliente C',
        situation: 'Completado',
        level: 'Bajo',
        status: 'Cerrado',
        responsiblePerson: 'Laura Martínez',
        department: 'Ventas',
        assignedPerson: 'Pedro Sánchez',
        commitmentDate: '2023-10-07',
        steps: 1,
        days: 0,
        comments: 'Caso resuelto satisfactoriamente',
      ),
    ];
  }
}
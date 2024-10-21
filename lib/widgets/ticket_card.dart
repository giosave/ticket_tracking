import 'package:flutter/material.dart';
import 'package:ticket_track/models/ticket.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final String colorKey;
  final Color textColor;

  /* Ticket Status, 1 = Alto, 2 = Medio, 3 = Bajo */
  final Map<String, Color> colorPalette = {
    'Completado': Colors.green,
    'En Proceso': Colors.yellow,
    'Pendiente': Colors.red,
  };

  TicketCard({
    required this.ticket,
    required this.colorKey,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.0,
      child: Card(
        color: colorPalette[colorKey] ?? Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Folio: ${ticket.folio}', style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
              Text('SAC Persona: ${ticket.assignedPerson}', style: TextStyle(color: textColor)),
              const Divider(),
              Text('Dias: ${ticket.days}', style: TextStyle(color: textColor)),
              Text('Nivel: ${ticket.level}', style: TextStyle(color: textColor)),
              Text('Estatus: ${ticket.status}', style: TextStyle(color: textColor)),
              Text('Escalones: ${ticket.steps}', style: TextStyle(color: textColor)),
              Text('Situacion: ${ticket.situation}', style: TextStyle(color: textColor)),
              const Divider(),
              Text('Cliente: ${ticket.client}', style: TextStyle(color: textColor)),
              Text('Departamento Responsable: ${ticket.department}', style: TextStyle(color: textColor)),
              Text('Responsable: ${ticket.responsiblePerson}', style: TextStyle(color: textColor)),
              Text('Fecha Compromiso: ${ticket.commitmentDate}', style: TextStyle(color: textColor)),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (selectedDate != null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Actualizar Fecha"),
                          content: Text("Nueva Fecha: ${selectedDate.toLocal()}"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cerrar"),
                            )
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Actualizar Fecha', style: TextStyle(color: textColor)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
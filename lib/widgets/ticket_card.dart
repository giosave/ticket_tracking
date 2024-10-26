import 'package:flutter/material.dart';
import 'package:ticket_track/models/ticket.dart';
import 'dart:html' as html;

class TicketCard extends StatefulWidget {
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
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.0,
      child: Card(
        color: widget.colorPalette[widget.colorKey] ?? Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Folio: ${widget.ticket.folio}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: widget.textColor)),
                      Text('SAC Persona: ${widget.ticket.assignedPerson}',
                          style: TextStyle(color: widget.textColor)),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Comentario"),
                            content: Text(widget.ticket.comments),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.info),
                  )
                ],
              ),
              const Divider(),
              Text('Dias: ${widget.ticket.days}',
                  style: TextStyle(color: widget.textColor)),
              Text('Nivel: ${widget.ticket.level}',
                  style: TextStyle(color: widget.textColor)),
              Text('Estatus: ${widget.ticket.status}',
                  style: TextStyle(color: widget.textColor)),
              Text('Escalones: ${widget.ticket.steps}',
                  style: TextStyle(color: widget.textColor)),
              Text('Situacion: ${widget.ticket.situation}',
                  style: TextStyle(color: widget.textColor)),
              const Divider(),
              Text('Cliente: ${widget.ticket.client}',
                  style: TextStyle(color: widget.textColor)),
              Text('Departamento Responsable: ${widget.ticket.department}',
                  style: TextStyle(color: widget.textColor)),
              Text('Responsable: ${widget.ticket.responsiblePerson}',
                  style: TextStyle(color: widget.textColor)),
              Text('Fecha Compromiso: ${widget.ticket.commitmentDate}',
                  style: TextStyle(color: widget.textColor)),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: const Text("Actualizar Fecha"),
                              content: Wrap(
                                children: [
                                  _buildEvidenceSection(),
                                  const Divider(),
                                  _buildChangeDate(context, setState)
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    if (_isInvalidDate(selectedDate)) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Error"),
                                            content: const Text("La fecha de compromiso debe ser mayor a la fecha actual."),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Cerrar"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      return;
                                    }
                                    bool? confirm = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Confirmación"),
                                          content: const Text("¿Estás seguro de actualizar la fecha?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(true);
                                              },
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.green,
                                              ),
                                              child: const Text("Sí"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(false);
                                              },
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.red,
                                              ),
                                              child: const Text("No"),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    if (confirm == true) {
                                      html.window.location.reload();
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Text("Actualizar Fecha:"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cerrar"),
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.update,
                    size: 24.0,
                  ),
                  label: const Text('Actualizar Estatus'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEvidenceSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Evidencia Enviada:", textAlign: TextAlign.center),
        Center(
          child: IconButton(
            onPressed: () async {
              bool? confirm = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Confirmación"),
                    content: const Text("¿Está seguro de notificar que ha enviado evidencia por correo?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                        child: const Text("Sí"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text("No"),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  );
                },
              );

              if (confirm == true) {
                html.window.location.reload();
              } else {
                return;
              }
            },
            icon: const Icon(Icons.mark_email_read),
          ),
        ),
      ],
    );
  }

  bool _isInvalidDate(DateTime date) {
    DateTime today = DateTime.now();
    DateTime todayWithoutTime = DateTime(today.year, today.month, today.day);
    return date.isBefore(todayWithoutTime) || 
          "${date.year}-${date.month}-${date.day}" == "${today.year}-${today.month}-${today.day}";
  }

  Widget _buildChangeDate(
      BuildContext context, void Function(void Function()) setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          direction: Axis.vertical,
          children: [
            const Text("Actualizar Fecha Compromiso:"),
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null && pickedDate != selectedDate) {
              setState(() {
                selectedDate = pickedDate;
              });
            }
          },
          icon: const Icon(Icons.alarm_rounded),
        ),
      ],
    );
  }
}
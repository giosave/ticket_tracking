import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_track/providers/new_ticket_provider.dart';

class NewTicket extends StatelessWidget {
  const NewTicket({super.key});

  static const double defaultWidth = 200;

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<NewTicketProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final double dropdownWidth = screenWidth * 0.4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Ticket'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth < 600 ? 20.0 : 150.0,
          right: screenWidth < 600 ? 20.0 : 150.0,
          top: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Datos del Departamento Involucrado:', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(
                thickness: 4,
                color: Colors.white60,
              ),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Folio',
                      ['001', '002', '003'],
                      (value) => ticketProvider.updateTicket('folio', value),
                      ticketProvider.folioError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Origen',
                      ['Interno', 'Externo'],
                      (value) => ticketProvider.updateTicket('origen', value),
                      ticketProvider.originError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Sitio',
                      ['Sitio A', 'Sitio B'],
                      (value) => ticketProvider.updateTicket('sitio', value),
                      ticketProvider.siteError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Cliente',
                      ['Cliente X', 'Cliente Y'],
                      (value) => ticketProvider.updateTicket('cliente', value),
                      ticketProvider.clientError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Situación',
                      ['Situación 1', 'Situación 2'],
                      (value) => ticketProvider.updateTicket('situacion', value),
                      ticketProvider.situationError,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),const SizedBox(height: 8.0),
              const Text('Datos del Ticket:',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(
                thickness: 4,
                color: Colors.white60,
              ),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Nivel',
                      ['Alto', 'Medio', 'Bajo'],
                      (value) => ticketProvider.updateTicket('nivel', value),
                      ticketProvider.levelError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Estatus',
                      ['Abierto', 'Cerrado'],
                      (value) => ticketProvider.updateTicket('estatus', value),
                      ticketProvider.statusError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Persona Encargada',
                      ['Persona 1', 'Persona 2'],
                      (value) => ticketProvider.updateTicket('personaEncargada', value),
                      ticketProvider.assignedPersonError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Departamento',
                      ['Depto 1', 'Depto 2'],
                      (value) => ticketProvider.updateTicket('departamento', value),
                      ticketProvider.departmentError,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),const SizedBox(height: 8.0),
              const Text('Fechas y Escalones:',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(
                thickness: 4,
                color: Colors.white60,
              ),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Persona Responsable',
                      ['Responsable 1', 'Responsable 2'],
                      (value) => ticketProvider.updateTicket('personaResponsable', value),
                      ticketProvider.responsiblePersonError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Fecha Compromiso',
                      ['Hoy', 'Mañana'],
                      (value) => ticketProvider.updateTicket('fechaCompromiso', value),
                      ticketProvider.commitmentDateError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Escalones',
                      ['1', '2', '3'],
                      (value) => ticketProvider.updateTicket('escalones', value),
                      ticketProvider.stepsError,
                    ),
                  ),
                  SizedBox(
                    width: dropdownWidth,
                    child: _buildDropdownField(
                      context,
                      'Días',
                      ['1', '2', '3'],
                      (value) => ticketProvider.updateTicket('dias', value),
                      ticketProvider.daysError,
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Comentarios'),
                maxLines: 5,
                onChanged: (value) {
                  ticketProvider.updateTicket('comentarios', value);
                },
              ),
              TextButton(
                onPressed: () {
                  final ticketProvider = Provider.of<NewTicketProvider>(context, listen: false);
                  final ticketData = ticketProvider.ticket;

                  if (ticketProvider.validateFields()) {
                    if (ticketData.comments == null || ticketData.comments!.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmación'),
                            content: const Text('¿Está seguro de crear el ticket sin comentarios?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Sí'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  print('Datos del ticket: $ticketData');
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      print('Datos del ticket: $ticketData');
                    }
                  } else {
                    print('Por favor, corrige los errores en el formulario.');
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context, String label, List<String> items, Function(String) onChanged,
    String? errorText) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
    );
  }
}

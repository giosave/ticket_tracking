import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreenTable extends StatefulWidget {
  const HomeScreenTable({super.key});

  @override
  State<HomeScreenTable> createState() => _HomeScreenTableState();
}

class _HomeScreenTableState extends State<HomeScreenTable> {
  DateTime? _startDate = DateTime.now();
  DateTime? _endDate = DateTime.now().add(Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 15),
      child: Column(
        children: [
          Wrap(
            spacing: 100.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              _buildIconTextButton(
                icon: Icons.calendar_today,
                text: _startDate == null
                    ? "Fecha inicio: No seleccionada"
                    : "Fecha inicio: ${_startDate!.toLocal().toString().split(' ')[0]}",
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _startDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      _startDate = picked;
                    });
                  }
                },
              ),
              _buildIconTextButton(
                icon: Icons.event,
                text: _endDate == null
                    ? "Fecha fin: No seleccionada"
                    : "Fecha fin: ${_endDate!.toLocal().toString().split(' ')[0]}",
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _endDate ?? DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      _endDate = picked;
                    });
                  }
                },
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_startDate != null && _endDate != null) {
                    if (_startDate!.isAfter(_endDate!)) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error de Fecha'),
                            content: const Text('Las fechas no tienen un rango válido.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Aceptar'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                    }
                  }
                },
                icon: const Icon(Icons.search),
                label: const Text('Buscar'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              dragStartBehavior: DragStartBehavior.down,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Acción'),
                  ),
                  DataColumn(
                    label: Text(
                      'Folio',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Fecha',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Origen',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Sitio',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Cliente',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Situación',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Nivel',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Estatus',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Persona Encargada de SAC',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Departamento Responsable',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Persona Responsable',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Fecha Compromiso',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Escalones',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Días',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Comentarios',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.email),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirmación'),
                                  content: const Text('¿Está seguro de reenviar el correo?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            TextEditingController emailController = TextEditingController();
                                            return AlertDialog(
                                              title: const Text('Reenviar Correo'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text('Ingrese los correos electrónicos separados por comas:'),
                                                  TextField(
                                                    controller: emailController,
                                                    decoration: const InputDecoration(
                                                      hintText: 'ejemplo1@correo.com, ejemplo2@correo.com',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Cancelar'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    String emails = emailController.text;
                                                    print('Correos ingresados: $emails');
                                                    Navigator.of(context).pop();
                                                    setState(() {});
                                                  },
                                                  child: const Text('Enviar'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Text('Sí'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const DataCell(Text('001')),
                      const DataCell(Text('2023-10-01')),
                      const DataCell(Text('Email')),
                      const DataCell(Text('Sitio A')),
                      const DataCell(Text('Cliente X')),
                      const DataCell(Text('Pendiente')),
                      const DataCell(Text('Alto')),
                      const DataCell(Text('En Proceso')),
                      const DataCell(Text('Juan Pérez')),
                      const DataCell(Text('IT')),
                      const DataCell(Text('Ana Gómez')),
                      const DataCell(Text('2023-10-10')),
                      const DataCell(Text('3')),
                      const DataCell(Text('5')),
                      const DataCell(Text('Requiere seguimiento desdes l qwiejqoiwjeqwjo ijqwoi ejoqiw eioqwoe jqoiwe joiqje oijqwoi oiqwe ioqiwo ejoiqj weoijqowiej qiowje oiqjoiwejoqjweoiqjowejio qjoiejqw ')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.email),
                          onPressed: () {
                            
                          },
                        ),
                      ),
                      const DataCell(Text('002')),
                      const DataCell(Text('2023-10-02')),
                      const DataCell(Text('Teléfono')),
                      const DataCell(Text('Sitio B')),
                      const DataCell(Text('Cliente Y')),
                      const DataCell(Text('Resuelto')),
                      const DataCell(Text('Medio')),
                      const DataCell(Text('Completado')),
                      const DataCell(Text('María López')),
                      const DataCell(Text('Ventas')),
                      const DataCell(Text('Carlos Ruiz')),
                      const DataCell(Text('2023-10-12')),
                      const DataCell(Text('2')),
                      const DataCell(Text('3')),
                      const DataCell(Text('Cliente satisfecho')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.email),
                          onPressed: () {
                            print('Fila 003 seleccionada');
                          },
                        ),
                      ),
                      const DataCell(Text('003')),
                      const DataCell(Text('2023-10-03')),
                      const DataCell(Text('Chat')),
                      const DataCell(Text('Sitio C')),
                      const DataCell(Text('Cliente Z')),
                      const DataCell(Text('En espera')),
                      DataCell(
                        Container(
                          color: Colors.transparent,
                          child: const Text(
                            'Bajo',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataCell(Text('Pendiente')),
                      const DataCell(Text('Luis Martínez')),
                      const DataCell(Text('Soporte')),
                      const DataCell(Text('Laura Fernández')),
                      const DataCell(Text('2023-10-15')),
                      const DataCell(Text('1')),
                      const DataCell(Text('7')),
                      const DataCell(Text('Esperando respuesta del cliente')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconTextButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        Text(text),
      ],
    );
  }
}

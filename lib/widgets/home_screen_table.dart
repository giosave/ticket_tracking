import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_track/providers/alert_provider.dart';

class HomeScreenTable extends StatelessWidget {
  const HomeScreenTable({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scrollbar(
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
                      final alertProvider = Provider.of<AlertProvider>(context, listen: false);
                      alertProvider.setMessage('¿Estás seguro de notificar a Giovanni, del ticket vencido?\nFecha inicial: 2023-10-01 \nFecha final: 2023-10-10');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmación'),
                            content: Text(alertProvider.message),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Notificar'),
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
                DataCell(
                  Container(
                    color: Colors.red,
                    child: const Text(
                      'Alto',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
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
                      print('Fila 002 seleccionada');
                    },
                  ),
                ),
                const DataCell(Text('002')),
                const DataCell(Text('2023-10-02')),
                const DataCell(Text('Teléfono')),
                const DataCell(Text('Sitio B')),
                const DataCell(Text('Cliente Y')),
                const DataCell(Text('Resuelto')),
                DataCell(
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                    ),
                    child: Text(
                      'Medio',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
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
    );
  }
}

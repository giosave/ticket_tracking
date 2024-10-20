import 'package:flutter/material.dart';
import '../models/ticket_model.dart';

class NewTicketProvider with ChangeNotifier {
  TicketModel _ticket = TicketModel();

  TicketModel get ticket => _ticket;

  String? folioError;
  String? dateError;
  String? originError;
  String? siteError;
  String? clientError;
  String? situationError;
  String? levelError;
  String? statusError;
  String? assignedPersonError;
  String? departmentError;
  String? responsiblePersonError;
  String? commitmentDateError;
  String? stepsError;
  String? daysError;
  String? commentsError;

  bool validateFields() {
    bool isValid = true;
    if (_ticket.folio == null || _ticket.folio!.isEmpty) {
      folioError = 'The folio field is required';
      isValid = false;
    } else {
      folioError = null;
    }
    if (_ticket.date == null || _ticket.date!.isEmpty) {
      dateError = 'The date field is required';
      isValid = false;
    } else {
      dateError = null;
    }
    if (_ticket.origin == null || _ticket.origin!.isEmpty) {
      originError = 'The origin field is required';
      isValid = false;
    } else {
      originError = null;
    }
    if (_ticket.site == null || _ticket.site!.isEmpty) {
      siteError = 'The site field is required';
      isValid = false;
    } else {
      siteError = null;
    }
    if (_ticket.client == null || _ticket.client!.isEmpty) {
      clientError = 'The client field is required';
      isValid = false;
    } else {
      clientError = null;
    }
    if (_ticket.situation == null || _ticket.situation!.isEmpty) {
      situationError = 'The situation field is required';
      isValid = false;
    } else {
      situationError = null;
    }
    if (_ticket.level == null || _ticket.level!.isEmpty) {
      levelError = 'The level field is required';
      isValid = false;
    } else {
      levelError = null;
    }
    if (_ticket.status == null || _ticket.status!.isEmpty) {
      statusError = 'The status field is required';
      isValid = false;
    } else {
      statusError = null;
    }
    if (_ticket.assignedPerson == null || _ticket.assignedPerson!.isEmpty) {
      assignedPersonError = 'The assigned person field is required';
      isValid = false;
    } else {
      assignedPersonError = null;
    }
    if (_ticket.department == null || _ticket.department!.isEmpty) {
      departmentError = 'The department field is required';
      isValid = false;
    } else {
      departmentError = null;
    } 
    if (_ticket.responsiblePerson == null || _ticket.responsiblePerson!.isEmpty) {
      responsiblePersonError = 'The responsible person field is required';
      isValid = false;
    } else {
      responsiblePersonError = null;
    }
    if (_ticket.commitmentDate == null || _ticket.commitmentDate!.isEmpty) {
      commitmentDateError = 'The commitment date field is required';
      isValid = false;  
    } else {
      commitmentDateError = null;
    }
    if (_ticket.steps == null || _ticket.steps!.isEmpty) {
      stepsError = 'The steps field is required';
      isValid = false;
    } else {
      stepsError = null;
    } 
    if (_ticket.days == null || _ticket.days!.isEmpty) {
      daysError = 'The days field is required';
      isValid = false;
    } else {
      daysError = null;
    }

    notifyListeners();
    return isValid;
  }

  void updateTicket(String key, String value) {
    switch (key) {
      case 'folio':
        _ticket.folio = value;
        break;
      case 'fecha':
        _ticket.date = value;
        break;
      case 'origen':
        _ticket.origin = value;
        break;
      case 'sitio':
        _ticket.site = value;
        break;
      case 'cliente':
        _ticket.client = value;
        break;
      case 'situacion':
        _ticket.situation = value;
        break;
      case 'nivel':
        _ticket.level = value;
        break;
      case 'estatus':
        _ticket.status = value;
        break;
      case 'personaEncargada':
        _ticket.assignedPerson = value;
        break;
      case 'departamento':
        _ticket.department = value;
        break;
      case 'personaResponsable':
        _ticket.responsiblePerson = value;
        break;
      case 'fechaCompromiso':
        _ticket.commitmentDate = value;
        break;
      case 'escalones':
        _ticket.steps = value;
        break;
      case 'dias':
        _ticket.days = value;
        break;
      case 'comentarios':
        _ticket.comments = value;
        break;
    }
    notifyListeners();
  }
}
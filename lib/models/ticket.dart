class Ticket {
  final String folio;
  final String date;
  final String origin;
  final String site;
  final String client;
  final String situation;
  final String level;
  final String status;
  final String assignedPerson;
  final String department;
  final String responsiblePerson;
  final String commitmentDate;
  final int steps;
  final int days;
  final String comments;

  Ticket({
    required this.folio,
    required this.date,
    required this.origin,
    required this.site,
    required this.client,
    required this.situation,
    required this.level,
    required this.status,
    required this.assignedPerson,
    required this.department,
    required this.responsiblePerson,
    required this.commitmentDate,
    required this.steps,
    required this.days,
    required this.comments,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      folio: json['folio'],
      date: json['date'],
      origin: json['origin'],
      site: json['site'],
      client: json['client'],
      situation: json['situation'],
      level: json['level'],
      status: json['status'],
      assignedPerson: json['assignedPerson'],
      department: json['department'],
      responsiblePerson: json['responsiblePerson'],
      commitmentDate: json['commitmentDate'],
      steps: json['steps'],
      days: json['days'],
      comments: json['comments'],
    );
  }
}

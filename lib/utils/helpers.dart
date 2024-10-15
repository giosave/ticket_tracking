class Helpers {
  static bool isTicketExpired(DateTime proposedDate) {
    return DateTime.now().isAfter(proposedDate);
  }
}
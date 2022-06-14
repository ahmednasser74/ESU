class TicketDetailsRequestModel {
  TicketDetailsRequestModel({
    required this.ticketId,
  });

  final int ticketId;

  Map<String, dynamic> toJson() => {
        'ticket_id': ticketId,
      };
}

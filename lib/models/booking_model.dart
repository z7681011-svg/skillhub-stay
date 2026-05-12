class BookingModel {
  const BookingModel({
    required this.stayTitle,
    required this.selectedOption,
    required this.dateText,
    required this.totalPrice,
    required this.bookingId,
  });

  final String stayTitle;
  final String selectedOption;
  final String dateText;
  final double totalPrice;
  final String bookingId;

  String get id => bookingId;
  String get stayName => stayTitle;
  String get guestName => selectedOption;
  String get date => dateText;
  double get total => totalPrice;
  String get status => 'Confirmed';
}

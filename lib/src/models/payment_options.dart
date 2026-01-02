class PaymentOptions {
  final int amount; // smallest currency unit
  final String currency;
  final Map<String, dynamic>? metadata;

  PaymentOptions({
    required this.amount,
    required this.currency,
    this.metadata,
  });
}

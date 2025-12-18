enum PaymentStatus { success, failure, pending, cancelled }

class PaymentResult {
  final PaymentStatus status;
  final String message;

  const PaymentResult({
    required this.status,
    this.message = '',
  });
}

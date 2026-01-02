// src/models/payment_result.dart
import 'payment_status.dart';

class PaymentResult {
  final bool success;
  final String? transactionId;
  final String? message;
  final PaymentStatus status;

  PaymentResult({
    required this.success,
    this.transactionId,
    this.message,
    required this.status,
  });
}

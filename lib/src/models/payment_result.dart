import 'package:anypay/anypay.dart';

class PaymentResult {
  final bool success;
  final PaymentStatus status;
  final String? transactionId;
  final String? message;
  final Object? raw;

  PaymentResult({
    required this.success,
    required this.status,
    this.transactionId,
    this.message,
    this.raw,
  });

  factory PaymentResult.success({
    required String transactionId,
    String? message,
    Object? raw,
  }) =>
      PaymentResult(
        success: true,
        status: PaymentStatus.success,
        transactionId: transactionId,
        message: message,
        raw: raw,
      );

  factory PaymentResult.failed({String? message, Object? raw}) => PaymentResult(
        success: false,
        status: PaymentStatus.failed,
        message: message,
        raw: raw,
      );

  factory PaymentResult.pending({String? message, Object? raw}) =>
      PaymentResult(
        success: false,
        status: PaymentStatus.pending,
        message: message,
        raw: raw,
      );

  factory PaymentResult.error({String? message, Object? raw}) => PaymentResult(
        success: false,
        status: PaymentStatus.error,
        message: message,
        raw: raw,
      );
}

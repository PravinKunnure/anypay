import 'package:anypay/anypay.dart';

/// Abstract class for payment provider adapters
abstract class PaymentAdapter {
  /// Charge a payment with the given options
  Future<PaymentResult> charge(PaymentOptions options);
}

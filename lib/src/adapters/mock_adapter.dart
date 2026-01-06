import 'dart:async';
import 'package:anypay/anypay.dart';

/// States for the mock adapter
enum MockPaymentState { success, failed, pending, error }

/// A fully configurable mock adapter for AnyPay
class MockAdapter implements PaymentAdapter {
  final MockPaymentState state;
  final Duration delay;

  MockAdapter(
      {this.state = MockPaymentState.success,
      this.delay = const Duration(seconds: 1)});

  @override
  Future<PaymentResult> charge(PaymentOptions options) async {
    await Future.delayed(delay); // simulate network/payment delay

    switch (state) {
      case MockPaymentState.success:
        return PaymentResult(
          success: true,
          transactionId: 'MOCK_TXN_123',
          message: 'Mock payment successful',
          status: PaymentStatus.success,
        );
      case MockPaymentState.failed:
        return PaymentResult(
          success: false,
          message: 'Mock payment failed',
          status: PaymentStatus.failed,
        );
      case MockPaymentState.pending:
        return PaymentResult(
          success: false,
          message: 'Mock payment pending',
          status: PaymentStatus.pending,
        );
      case MockPaymentState.error:
        return PaymentResult(
          success: false,
          message: 'Mock payment error',
          status: PaymentStatus.error,
        );
    }
  }
}

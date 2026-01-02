import 'package:anypay/anypay.dart';

class ExampleAdapter implements PaymentAdapter {
  @override
  Future<PaymentResult> charge(PaymentOptions options) async {
    await Future.delayed(const Duration(seconds: 1));

    // Randomly simulate success/fail/pending/error ///YOU CAN ADD YOU LOGIC AND UI/UX Changes Here.
    final rnd = DateTime.now().second % 4;

    switch (rnd) {
      case 0:
        return PaymentResult(
          success: true,
          transactionId: 'TXN123SUCCESS',
          message: 'Payment successful',
          status: PaymentStatus.success,
        );
      case 1:
        return PaymentResult(
          success: false,
          transactionId: 'TXN124FAILED',
          message: 'Payment failed',
          status: PaymentStatus.failed,
        );
      case 2:
        return PaymentResult(
          success: false,
          transactionId: 'TXN125PENDING',
          message: 'Payment pending',
          status: PaymentStatus.pending,
        );
      default:
        return PaymentResult(
          success: false,
          transactionId: null,
          message: 'Payment error',
          status: PaymentStatus.error,
        );
    }
  }
}

class MockAdapter implements PaymentAdapter {
  @override
  Future<PaymentResult> charge(PaymentOptions options) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return PaymentResult(
      success: true,
      transactionId: 'MOCKTXN',
      message: 'Mock payment successful',
      status: PaymentStatus.success,
    );
  }
}

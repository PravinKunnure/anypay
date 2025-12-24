import 'package:anypay/anypay.dart';

class DummyGateway implements PaymentGateway {
  @override
  Future<PaymentStatus> pay({
    required double amount,
    required String currency,
    required Map<String, dynamic> metadata,
    required String method, // "Card", "UPI", "NetBanking"
  }) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network call

    print("Payment method: $method");
    if (metadata.containsKey("app")) {
      print("UPI app: ${metadata["app"]}");
    }

    // Simulate success for UPI, failure for others
    if (method == "UPI") {
      return PaymentStatus.success;
    } else if (method == "Card") {
      return PaymentStatus.failure;
    } else {
      return PaymentStatus.pending; // Net Banking example
    }
  }
}

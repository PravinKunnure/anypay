import 'package:anypay/anypay.dart';

abstract class PaymentGateway {
  Future<PaymentStatus> pay({
    required double amount,
    required String currency,
    required Map<String, dynamic> metadata,
    required String method, // "Card", "UPI", "NetBanking"
  });
}

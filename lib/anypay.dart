library anypay;

export 'src/models/payment_options.dart';
export 'src/models/payment_result.dart';
export 'src/adapters/payment_adapter.dart';
export 'src/utils/logger.dart';
export 'src/utils/payment_status_overlay.dart';
export 'src/utils/payment_status_widget.dart';
export 'src/models/payment_status.dart';

// lib/anypay.dart
import 'src/adapters/payment_adapter.dart';
import 'src/models/payment_options.dart';
import 'src/models/payment_result.dart';
import 'src/models/payment_status.dart';
import 'src/utils/logger.dart';

class AnyPay {
  static final Map<String, PaymentAdapter> _adapters = {};

  /// Register a payment adapter
  static void registerAdapter(String providerName, PaymentAdapter adapter) {
    _adapters[providerName] = adapter;
    Logger.log('Registered adapter for provider: $providerName');
  }

  static bool isRegistered(String providerName) =>
      _adapters.containsKey(providerName);

  /// Charge payment and return result with status
  static Future<PaymentResult> charge({
    required String providerName,
    required PaymentOptions options,
  }) async {
    final adapter = _adapters[providerName];
    if (adapter == null) {
      return PaymentResult(
        success: false,
        status: PaymentStatus.error,
        message: 'Payment provider "$providerName" is not registered.',
      );
    }

    try {
      final result = await adapter.charge(options);

      // Assign status based on SDK result
      PaymentStatus status;
      if (result.success) {
        status = PaymentStatus.success;
      } else if (result.message?.toLowerCase().contains('pending') ?? false) {
        status = PaymentStatus.pending;
      } else {
        status = PaymentStatus.failed;
      }

      return PaymentResult(
        success: result.success,
        transactionId: result.transactionId,
        message: result.message,
        status: status,
      );
    } catch (e) {
      return PaymentResult(
        success: false,
        status: PaymentStatus.error,
        message: e.toString(),
      );
    }
  }
}

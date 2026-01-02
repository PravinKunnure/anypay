library anypay;

export 'src/models/payment_options.dart';
export 'src/models/payment_result.dart';
export 'src/adapters/payment_adapter.dart';
export 'src/utils/logger.dart';
export 'src/utils/payment_status_overlay.dart';
export 'src/utils/payment_status_widget.dart';
export 'src/models/payment_provider.dart'; // Add enum export
export 'src/models/payment_status.dart'; // Add enum export

// lib/anypay.dart
import 'src/adapters/payment_adapter.dart';
import 'src/models/payment_options.dart';
import 'src/models/payment_result.dart';
import 'src/models/payment_provider.dart';
import 'src/utils/logger.dart';

class AnyPay {
  static final Map<String, PaymentAdapter> _adapters = {};

  /// Register a payment adapter
  static void registerAdapter(String providerName, PaymentAdapter adapter) {
    _adapters[providerName] = adapter;
    Logger.log('Registered adapter for provider: $providerName');
  }

  /// Check if provider is registered
  static bool isRegistered(String providerName) =>
      _adapters.containsKey(providerName);

  /// Charge payment using String provider name
  static Future<PaymentResult> chargeWithName({
    required String providerName,
    required PaymentOptions options,
  }) async {
    final adapter = _adapters[providerName];
    if (adapter == null) {
      return PaymentResult.error(
        message: 'Payment provider "$providerName" is not registered.',
      );
    }

    try {
      // Let adapter return proper PaymentResult
      final result = await adapter.charge(options);
      return result;
    } catch (e) {
      return PaymentResult.error(message: e.toString());
    }
  }

  /// Charge payment using enum provider
  static Future<PaymentResult> charge({
    required PaymentProvider provider,
    required PaymentOptions options,
  }) =>
      chargeWithName(providerName: provider.name, options: options);
}

import 'package:flutter/material.dart';

class CardPaymentScreen extends StatelessWidget {
  final Function(String cardNumber, String expiry, String cvv) onPay;
  const CardPaymentScreen({super.key, required this.onPay});

  @override
  Widget build(BuildContext context) {
    final cardNumberController = TextEditingController();
    final expiryController = TextEditingController();
    final cvvController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.lightBlueAccent]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                  child: Text("Card Preview",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
            ),
            const SizedBox(height: 24),
            _inputField("Card Number", cardNumberController, Icons.credit_card),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _inputField(
                        "Expiry", expiryController, Icons.date_range)),
                const SizedBox(width: 16),
                Expanded(child: _inputField("CVV", cvvController, Icons.lock)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => onPay(cardNumberController.text,
                    expiryController.text, cvvController.text),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Colors.blue),
                child: const Text("Pay Now",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputField(
      String hint, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

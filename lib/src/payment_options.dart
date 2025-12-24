import 'package:flutter/material.dart';

class PaymentOptions extends StatelessWidget {
  final Function(String method) onSelect;

  const PaymentOptions({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _paymentCard(context, "Pay with Card", Icons.credit_card, Colors.blue,
            () => onSelect("Card")),
        _paymentCard(context, "Pay with UPI", Icons.account_balance_wallet,
            Colors.green, () => onSelect("UPI")),
        _paymentCard(context, "Pay with Net Banking", Icons.account_balance,
            Colors.orange, () => onSelect("NetBanking")),
      ],
    );
  }

  Widget _paymentCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 24,
                  backgroundColor: color.withValues(alpha: 0.2),
                  child: Icon(icon, color: color, size: 28)),
              const SizedBox(width: 16),
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16)
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class PaymentOptions extends StatelessWidget {
//   final Function(String method, [String? app]) onSelected;
//
//   const PaymentOptions({super.key, required this.onSelected});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Card Option
//         Card(
//           margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//           child: ListTile(
//             leading: const Icon(Icons.credit_card, color: Colors.blue),
//             title: const Text("Pay with Card"),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () => onSelected("Card"),
//           ),
//         ),
//         // UPI Option
//         Card(
//           margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//           child: ListTile(
//             leading: const Icon(Icons.account_balance_wallet, color: Colors.green),
//             title: const Text("Pay with UPI"),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () => _showUpiApps(context),
//           ),
//         ),
//         // Net Banking Option
//         Card(
//           margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//           child: ListTile(
//             leading: const Icon(Icons.account_balance, color: Colors.orange),
//             title: const Text("Pay with Net Banking"),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () => onSelected("NetBanking"),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _showUpiApps(BuildContext context) {
//     List<String> upiApps = ["Google Pay", "PhonePe", "Paytm", "BHIM"];
//     showModalBottomSheet(
//       context: context,
//       builder: (_) {
//         return SizedBox(
//           height: 200,
//           child: ListView.builder(
//             itemCount: upiApps.length,
//             itemBuilder: (_, index) {
//               return ListTile(
//                 leading: Icon(Icons.apps),
//                 title: Text(upiApps[index]),
//                 onTap: () {
//                   Navigator.pop(context);
//                   onSelected("UPI", upiApps[index]);
//                 },
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// //
// // class PaymentOptions extends StatelessWidget {
// //   final Function(String method) onSelected;
// //
// //   const PaymentOptions({super.key, required this.onSelected});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         ElevatedButton(
// //           onPressed: () => onSelected("Card"),
// //           child: const Text("Pay with Card"),
// //         ),
// //         ElevatedButton(
// //           onPressed: () => onSelected("UPI"),
// //           child: const Text("Pay with UPI"),
// //         ),
// //         ElevatedButton(
// //           onPressed: () => onSelected("NetBanking"),
// //           child: const Text("Pay with Net Banking"),
// //         ),
// //       ],
// //     );
// //   }
// // }

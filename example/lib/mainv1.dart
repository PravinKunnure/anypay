// import 'package:flutter/material.dart';
// import 'package:anypay/anypay.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   PaymentStatus status = PaymentStatus.pending;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: AnyPay(
//           title: "AnyPay Demo",
//           // status: status,
//           theme: const AnyPayTheme(
//             primaryColor: Colors.orange,
//             successColor: Colors.green,
//             failureColor: Colors.red,
//           ), gateway: null, amount: null,
//         ),
//         floatingActionButton: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//               heroTag: 'pending',
//               onPressed: () => setState(() => status = PaymentStatus.pending),
//               child: const Icon(Icons.hourglass_empty),
//             ),
//             const SizedBox(height: 10),
//             FloatingActionButton(
//               heroTag: 'success',
//               onPressed: () => setState(() => status = PaymentStatus.success),
//               child: const Icon(Icons.check),
//             ),
//             const SizedBox(height: 10),
//             FloatingActionButton(
//               heroTag: 'failure',
//               onPressed: () => setState(() => status = PaymentStatus.failure),
//               child: const Icon(Icons.close),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

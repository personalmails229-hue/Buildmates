import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/app_state.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final _amount = TextEditingController(text: '500');

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Balance: ₹${state.walletBalance.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            TextField(controller: _amount, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Top-up Amount')),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final amt = double.tryParse(_amount.text) ?? 0;
                if (amt <= 0) return;
                // In a real app: call Razorpay SDK, then on success call state.topUp
                Provider.of<AppState>(context, listen: false).topUp(amt);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Top-up (demo) successful — Razorpay integration placeholder.')));
              },
              child: const Text('Top-up (Razorpay)'),
            ),
            const SizedBox(height: 20),
            const Text('Escrow: Payments held until job completion (demo suggestion)'),
          ],
        ),
      ),
    );
  }
}

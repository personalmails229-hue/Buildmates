import 'package:flutter/material.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _rate = TextEditingController(text: '1000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Job')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _title, decoration: const InputDecoration(labelText: 'Job Title')),
            const SizedBox(height: 8),
            TextField(controller: _desc, decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 8),
            TextField(controller: _rate, decoration: const InputDecoration(labelText: 'Daily Rate (₹)'), keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // In real app: save to backend, charge posting fee (₹30) via Razorpay
                showDialog(context: context, builder: (_) => AlertDialog(
                  title: const Text('Job Posted (demo)'),
                  content: const Text('Job has been posted. Posting fee and escrow flows to be implemented.'),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                ));
              },
              child: const Text('Post Job (₹30 posting fee)'),
            ),
          ],
        ),
      ),
    );
  }
}

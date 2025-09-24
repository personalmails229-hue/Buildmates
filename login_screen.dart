import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/app_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController(text: 'Contractor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BuildMate - Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Name')),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Provider.of<AppState>(context, listen: false).login(_controller.text.trim());
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Continue'),
            ),
            const SizedBox(height: 20),
            const Text('Demo account: Contractor / Labour / Supervisor'),
          ],
        ),
      ),
    );
  }
}

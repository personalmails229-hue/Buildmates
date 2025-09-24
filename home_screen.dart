import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('BuildMate'), actions: [
        IconButton(onPressed: () => Navigator.pushNamed(context, '/wallet'), icon: const Icon(Icons.account_balance_wallet)),
        IconButton(onPressed: () => Navigator.pushNamed(context, '/chat'), icon: const Icon(Icons.chat)),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, ${state.userName}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/post-job'),
              icon: const Icon(Icons.post_add),
              label: const Text('Post a Job'),
            ),
            const SizedBox(height: 12),
            const Text('Jobs Nearby', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Expanded(child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, idx) => Card(
                child: ListTile(
                  title: Text('Job #${idx+1} — Tile work'),
                  subtitle: const Text('Location: 2.3 km away • ₹1200/day'),
                  trailing: ElevatedButton(onPressed: () {}, child: const Text('Invite')),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

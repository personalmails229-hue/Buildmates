import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/post_job_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/chat_screen.dart';
import 'services/app_state.dart';

void main() {
  runApp(const BuildMateApp());
}

class BuildMateApp extends StatelessWidget {
  const BuildMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'BuildMate',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (_) => const LoginScreen(),
          '/home': (_) => const HomeScreen(),
          '/post-job': (_) => const PostJobScreen(),
          '/wallet': (_) => const WalletScreen(),
          '/chat': (_) => const ChatScreen(),
        },
      ),
    );
  }
}

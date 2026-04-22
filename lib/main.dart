import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'services/api_service.dart';

Future<void> main() async {
  // 1. Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Load environment variables
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const TestConnectionScreen());
  }
}

class TestConnectionScreen extends StatefulWidget {
  const TestConnectionScreen({super.key});

  @override
  State<TestConnectionScreen> createState() => _TestConnectionScreenState();
}

class _TestConnectionScreenState extends State<TestConnectionScreen> {
  final ApiService _apiService = ApiService();
  String _status = "Press the button to test API";

  void _testConnection() async {
    setState(() => _status = "Fetching token...");
    String? token = await _apiService.getAccessToken();

    setState(() {
      _status = (token != null)
          ? "Success! Check your terminal."
          : "Failed to fetch token.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("42 API Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _testConnection,
              child: const Text("Get Access Token"),
            ),
          ],
        ),
      ),
    );
  }
}

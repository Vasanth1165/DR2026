import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/providers/counter_provider.dart';
import 'package:provider_sm/providers/elemets_provider.dart';
import 'package:provider_sm/providers/postion_provider.dart';
import 'package:provider_sm/screens/home_screen.dart';
import 'package:provider_sm/screens/postion_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => PostionProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ElementsProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

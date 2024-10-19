import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/providers/color_cart_provider.dart';
import 'package:provider_sm/providers/counter_provider.dart';
import 'package:provider_sm/providers/elemets_provider.dart';
import 'package:provider_sm/providers/postion_provider.dart';
import 'package:provider_sm/providers/theme_provider.dart';
import 'package:provider_sm/screens/home_screen.dart';

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
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ColorCartProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      themeMode: themeMode.theme,
      theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(color: Colors.green)),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(color: Colors.yellow)),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

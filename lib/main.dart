import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/main_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey:'AIzaSyBjKtbXTDGl0uKRlBR6uwTnW-WIItApiZE',
      appId:'fir-tutorial-d41cf',
      messagingSenderId:'1:783126879677:android:c6ec56bb98c4d499b206d4',
      projectId:'fir-tutorial-d41cf'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}



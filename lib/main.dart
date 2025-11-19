import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/contacts_page.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6A26C8), // purple tone
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6A26C8),
          elevation: 0,
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/contacts': (context) => const ContactsPage(),
      },
    );
  }
}

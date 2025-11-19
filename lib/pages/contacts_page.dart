import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../models/person.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  bool _loading = true;
  List<Person> _people = [];
  Person? _selected;

  @override
  void initState() {
    super.initState();
    _loadPersons();
  }

  Future<void> _loadPersons() async {
    // Person.readData already has a 1s delay but to be safe we show loader
    final data = await Person.readData();
    setState(() {
      _people = data;
      // Grundinitialisiert mit Max Mustermann falls vorhanden, sonst first()
      _selected = _people.firstWhere(
            (p) => p.firstname.toLowerCase() == 'max' && p.lastname.toLowerCase() == 'mustermann',
        orElse: () => _people.first, // _people.isNotEmpty ? _people.first : null,
      );
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF6A26C8);
    const grey = Color(0xFF757575);

    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: purple,
        title: const Text('Contacts', style: TextStyle(color: Colors.white,)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _loading ? Container() : _people.isEmpty
                ? const Text('Keine Kontakte gefunden')
                : DropdownButton<Person>(
              isExpanded: true,
              value: _selected,
              hint: const Text('Wähle eine Person'),
              items: _people.map((p) {
                return DropdownMenuItem<Person>(
                  value: p,
                  child: Text(p.fullName),
                );
              }).toList(),
              onChanged: (Person? p) {
                if (p != null) {
                  // liefert die Person an die Hauptseite zurück
                  Navigator.pop(context, p);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

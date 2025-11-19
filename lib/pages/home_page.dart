import 'package:flutter/material.dart';
import '../models/person.dart';
import '../widgets/person_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Person> favorites = [];

  void addPerson(Person p) {
    final exists = favorites.any(
            (e) => e.firstname.toLowerCase() == p.firstname.toLowerCase() && e.lastname.toLowerCase() == p.lastname.toLowerCase());
    if (exists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Datensatz nicht hinzugefügt — bereits vorhanden'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    setState(() => favorites.add(p));
  }

  void removePerson(Person p) {
    setState(() => favorites.remove(p));
  }

  void sortByFirstname() {
    setState(() {
      favorites.sort((a, b) => a.firstname.toLowerCase().compareTo(b.firstname.toLowerCase()));
    });
  }

  Future<void> openContactsPage() async {
    final result = await Navigator.pushNamed(context, '/contacts');
    if (result is Person) {
      addPerson(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF6A26C8);
    const grey = Color(0xFF757575);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        title: Row(
          children: [
            // left circular avatar like screenshot
            CircleAvatar(
              backgroundColor: Colors.black12,
              child: ClipOval(
                child: Image.asset(
                  'resources/assets/icon/contacticon.png',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                  errorBuilder: (context, err, st) => const Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text('My Contacts', style: TextStyle(color: Colors.white,)),
            const Spacer(),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: openContactsPage,
          ),
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            color: Colors.white,
            onPressed: sortByFirstname,
          ),
        ],
      ),
      body: Container(
        color: grey,
        child: favorites.isEmpty
            ? const Center(
          child: Text(
            'Kein Favorit hinzugefügt.\nTippe auf + um Kontakte auszuwählen.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final person = favorites[index];
            print(person.imageUrl);
            return PersonTile(
              person: person,
              onDelete: () => removePerson(person),
            );
          },
        ),
      ),
    );
  }
}

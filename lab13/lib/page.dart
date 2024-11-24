import 'package:flutter/material.dart';
import '/note.dart';
import '/database_helper.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> _notes = [];
  final _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateNote(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не повинне залишатися пустим';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    _notes = await DatabaseHelper.instance.getNotes();
    setState(() {});
  }

  void _addNote() {
    final text = _controller.text;
    DatabaseHelper.instance.insertNote(Note(text: text));
    _controller.clear();
    _loadNotes();

  }

  void _deleteNote(int id) {
    DatabaseHelper.instance.deleteNote(id);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      validator: _validateNote,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addNote();
                      }
                    },
                    child: const Text('Додати'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return ListTile(
                  title: Text(note.text),
                  subtitle: Text(note.formattedDate),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteNote(note.id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
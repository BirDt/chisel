import 'package:chisel/Services/Database%20Services/notes_service.dart';
import 'package:flutter/material.dart';

import '../../../Models/Notes/note.dart';
import '../../../Screens/Editor/editor_screen.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final NotesService notesService = NotesService();
  List<Note> notes = [];

  @override
  void initState() { 
    super.initState();

    Stream<List<Note>> queryStream = notesService.watch();

    queryStream.listen((newResult) {
      setState(() {
        notes = newResult;
      });
    });

    // Initial notes state
    notesService.getAll().then((List<Note> val) {
      setState(() {
        notes = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final item = notes[index];

          return Card(
            color: Color.fromARGB(150, Theme.of(context).colorScheme.secondary.red, Theme.of(context).colorScheme.secondary.green, Theme.of(context).colorScheme.secondary.blue),
            child: ListTile(
              title: Text(item.titleText),
              subtitle: item.previewText != null ? Text(item.previewText!) : Container(),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditorScreen(
                  note: item,
                )));
              },
              trailing: IconButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => SimpleDialog(
                      title: const Text("Delete Note?"),
                      children: [
                        const Padding(padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                            child: Text("Deleted notes cannot be recovered!")
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  notesService.delete(item);
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Text("Delete it!",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.bold)),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text("Go back!",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.bold)),
                                ))
                          ],
                        )
                      ],
                    )
                  ),
                  icon: const Icon(Icons.delete_outline)),
            ),
          );
        }
      )
    );
  }
}

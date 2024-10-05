import 'package:chisel/Screens/Editor/editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../Models/Notes/Notebooks/notebook.dart';
import '../../../Services/Database Services/notes_service.dart';

class NotebookActionButton extends StatefulWidget {
  final Notebook notebook;
  const NotebookActionButton({super.key, required this.notebook});

  @override
  State<NotebookActionButton> createState() => _NotebookActionButtonState();
}

class _NotebookActionButtonState extends State<NotebookActionButton> {
  final NotesService notesService = NotesService();

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      shape: const CircleBorder(),
      spacing: 5,
      spaceBetweenChildren: 10,
      children: [
        SpeedDialChild(
            child: const Icon(Icons.note_add_outlined),
            label: "New Note",
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            labelBackgroundColor: Theme.of(context).colorScheme.primary,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            shape: const CircleBorder(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditorScreen(notebook: widget.notebook)));
            }),
        SpeedDialChild(
            child: const Icon(Icons.delete_forever_outlined),
            label: "Delete Notebook",
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            labelBackgroundColor: Theme.of(context).colorScheme.primary,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            shape: const CircleBorder(),
            onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => SimpleDialog(
                      title: const Text("Delete Notebook?"),
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Text("The notebook, and all it's notes, will be unrecoverable!")),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  notesService.deleteNotebook(widget.notebook);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
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
                    )))
      ],
      icon: Icons.add,
      activeIcon: Icons.close,
    );
  }
}

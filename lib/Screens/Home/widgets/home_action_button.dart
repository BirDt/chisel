import 'package:chisel/Screens/Editor/editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../Models/Notes/Notebooks/notebook.dart';
import '../../../Services/Database Services/notes_service.dart';

class HomeActionButton extends StatefulWidget {
  const HomeActionButton({super.key});

  @override
  State<HomeActionButton> createState() => _HomeActionButtonState();
}

class _HomeActionButtonState extends State<HomeActionButton> {
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
            labelStyle:Theme.of(context).textTheme.bodyMedium,
            shape: const CircleBorder(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditorScreen()));
            }
        ),
        SpeedDialChild(
          child: const Icon(Icons.create_new_folder_outlined),
          label: "New Notebook",
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          labelBackgroundColor: Theme.of(context).colorScheme.primary,
          labelStyle:Theme.of(context).textTheme.bodyMedium,
          shape: const CircleBorder(),
          onTap: () async {
            notesService.putNotebook(Notebook.empty());
          }
        )
      ],
      icon: Icons.add,
      activeIcon: Icons.close,
    );
  }
}

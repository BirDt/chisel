import 'dart:developer';

import 'package:chisel/Common/widgets/Notes%20List/notebook_view.dart';
import 'package:chisel/Common/widgets/chisel_app_bar.dart';
import 'package:chisel/Models/Notes/Notebooks/notebook.dart';
import 'package:chisel/Screens/Notebook/widgets/notebook_action_button.dart';
import 'package:chisel/Screens/Settings/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../Services/Database Services/notes_service.dart';

class NotebookScreen extends StatefulWidget {
  final Notebook notebook;
  const NotebookScreen({super.key, required this.notebook});

  @override
  State<NotebookScreen> createState() => _NotebookScreenState();
}

class _NotebookScreenState extends State<NotebookScreen> {
  final NotesService notesService = NotesService();
  final _controller = TextEditingController();

  Notebook? currentNotebook;

  String titleText = "";

  @override
  void initState() {
    super.initState();

    currentNotebook = widget.notebook;
    titleText = currentNotebook!.title;

    _controller.text = currentNotebook!.title;

    log("NOTEBOOK HAS PASSWORD? ${currentNotebook!.password}");

    _controller.addListener(() async {
      currentNotebook!.title = _controller.text;
      titleText = currentNotebook!.title;
      await notesService.putNotebook(currentNotebook!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ChiselAppBar(
        children: [
          IconButton(
              onPressed: () {
                if (currentNotebook!.password == null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SettingsScreen(notebook: currentNotebook!)));
                }
              },
              icon: const Icon(Icons.settings_outlined)),
          const Spacer(),
          InkWell(
            onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => SimpleDialog(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _controller,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Text("OK",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.bold))),
                        )
                      ],
                    )),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox.fromSize(
                    size: const Size(200, 500),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(titleText,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  ),
                ),
                const Icon(Icons.edit_outlined)
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: NotebookActionButton(notebook: widget.notebook),
      body: SafeArea(child: NotebookView(notebook: widget.notebook)),
    );
  }
}

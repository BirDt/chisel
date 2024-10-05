import 'package:chisel/Common/widgets/chisel_app_bar.dart';
import 'package:chisel/Screens/Editor/widgets/chisel_editor.dart';
import 'package:chisel/Screens/Editor/widgets/chisel_editor_toolbar.dart';
import 'package:chisel/Screens/Editor/widgets/drawer/sidebar_tools.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keyboard_service/keyboard_service.dart';

import '../../Models/Notes/note.dart';
import '../../Services/Database Services/notes_service.dart';

class EditorScreen extends StatefulWidget {
  final Note? note;
  const EditorScreen({super.key, this.note});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final NotesService notesService = NotesService();
  final QuillController _controller = QuillController.basic();
  Note? currentNote;

  @override
  void initState() {
    super.initState();

    setState(() {
      if (widget.note != null) {
        setState(() {
          currentNote = widget.note;
        });
      }
      else {
        currentNote = Note.blank();
      }

      _controller.document = currentNote!.document;

      _controller.addListener(() {
        currentNote!.document = _controller.document;
        currentNote!.lastEditedAt = DateTime.now();
        notesService.put(currentNote!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ChiselAppBar(
        children: [
          const Spacer(),
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu_open_outlined));
          }),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: !KeyboardService.isVisible(context)
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_back_ios_new_outlined),
            )
          : Container(),
      drawer: SafeArea(
        child: Drawer(
            child: ContainedTabBarView(
                tabs: const [
                  Icon(Icons.search_outlined), // QuickView
                  Icon(Icons.category_outlined), // Note MetaData
                  Icon(Icons.handyman_outlined), // Toolbar
                ],
                views: [
                  Container(),
                  Container(),
                  SidebarTools(controller: _controller)
                ])
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChiselEditor(
                    controller: _controller
                )
              ),
            ),
          ),
          ChiselEditorToolbar(
            controller: _controller,
          )
        ],
      ),
    );
  }
}

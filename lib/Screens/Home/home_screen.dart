import 'package:chisel/Common/widgets/Notes%20List/notes_view.dart';
import 'package:chisel/Common/widgets/chisel_app_bar.dart';
import 'package:chisel/Screens/Home/widgets/home_action_button.dart';
import 'package:chisel/Screens/Settings/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ChiselAppBar(
          children: [
            IconButton(
                onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => SimpleDialog(
                          title: const Text("About Chisel"),
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Text(
                                  "Chisel is a notes app and text editor for creative writers. It is currently in very early development.\n\nUse 'Notes' for quick note taking, and 'Notebooks' for organisation.\nFor example, a novel writer may use a Notebook to store their whole book, and use Notes for each chapter."),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text("OK",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              fontWeight: FontWeight.bold)),
                                    )))
                          ],
                        )),
                icon: const Icon(Icons.help_outline_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                },
                icon: const Icon(Icons.settings_outlined)),
            const Spacer(),
            Text(
              "Chisel",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        floatingActionButton: const HomeActionButton(),
      body: const SafeArea(child: NotesView()),
    );
  }
}

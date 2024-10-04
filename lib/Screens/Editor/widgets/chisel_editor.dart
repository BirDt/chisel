import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class ChiselEditor extends StatefulWidget {
  final QuillController controller;

  const ChiselEditor({super.key, required this.controller});

  @override
  State<ChiselEditor> createState() => _ChiselEditorState();
}

class _ChiselEditorState extends State<ChiselEditor> {
  @override
  Widget build(BuildContext context) {
    return QuillEditor.basic(
      controller: widget.controller,
      configurations: QuillEditorConfigurations(
        embedBuilders: kIsWeb
            ? FlutterQuillEmbeds.editorWebBuilders()
            : FlutterQuillEmbeds.editorBuilders(),
      ),
    );
  }
}

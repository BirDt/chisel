import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:keyboard_service/keyboard_service.dart';

class ChiselEditorToolbar extends StatefulWidget {
  final QuillController controller;
  const ChiselEditorToolbar({super.key, required this.controller});

  @override
  State<ChiselEditorToolbar> createState() => _ChiselEditorToolbarState();
}

class _ChiselEditorToolbarState extends State<ChiselEditorToolbar> {
  @override
  Widget build(BuildContext context) {
    return KeyboardService.isVisible(context)
        ? QuillToolbar(
            configurations: const QuillToolbarConfigurations(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: Wrap(children: [
                  QuillToolbarHistoryButton(
                    isUndo: true,
                    controller: widget.controller,
                  ),
                  QuillToolbarHistoryButton(
                    isUndo: false,
                    controller: widget.controller,
                  ),
                  QuillToolbarToggleStyleButton(
                    options: const QuillToolbarToggleStyleButtonOptions(),
                    controller: widget.controller,
                    attribute: Attribute.bold,
                  ),
                  QuillToolbarToggleStyleButton(
                    options: const QuillToolbarToggleStyleButtonOptions(),
                    controller: widget.controller,
                    attribute: Attribute.italic,
                  ),
                  /*QuillToolbarToggleStyleButton(
                        controller: widget.controller,
                        attribute: Attribute.underline,
                      ),*/
                  QuillToolbarClearFormatButton(
                    controller: widget.controller,
                  ),
                  const VerticalDivider(),
                  QuillToolbarSelectHeaderStyleButtons(
                    controller: widget.controller,
                  ),
                  QuillToolbarColorButton(
                      controller: widget.controller, isBackground: true),
                  QuillToolbarColorButton(
                      controller: widget.controller, isBackground: false),
                  const VerticalDivider(),
                  QuillToolbarToggleCheckListButton(
                    controller: widget.controller,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: widget.controller,
                    attribute: Attribute.ol,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: widget.controller,
                    attribute: Attribute.ul,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: widget.controller,
                    attribute: Attribute.blockQuote,
                  ),
                  const VerticalDivider(),
                  Builder(builder: (context) {
                    return QuillToolbarImageButton(
                      controller: widget.controller,
                      options: QuillToolbarImageButtonOptions(
                          afterButtonPressed: () {
                        KeyboardService.dismiss(unfocus: context);
                      }),
                    );
                  }),
                ]),
              ),
            ))
        : Container();
  }
}

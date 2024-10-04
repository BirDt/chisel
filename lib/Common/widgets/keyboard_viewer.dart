import 'package:keyboard_service/keyboard_service.dart';
import 'package:flutter/material.dart';

class KeyboardViewer extends StatefulWidget {
  final bool hideOnKeyboardRaise;
  final Widget child;
  const KeyboardViewer({super.key, this.hideOnKeyboardRaise = false, required this.child});

  @override
  State<KeyboardViewer> createState() => _KeyboardViewerState();
}

class _KeyboardViewerState extends State<KeyboardViewer> {
  @override
  Widget build(BuildContext context) {
    if (!widget.hideOnKeyboardRaise && KeyboardService.isVisible(context)) {
      return widget.child;
    }
    else if (widget.hideOnKeyboardRaise && !KeyboardService.isVisible(context)) {
      return widget.child;
    }
    else {
      return Container();
    }
  }
}

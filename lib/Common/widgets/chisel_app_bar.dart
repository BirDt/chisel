import 'package:flutter/material.dart';

//TODO this needs to have children passed in

class ChiselAppBar extends StatefulWidget {
  final List<Widget> children;
  const ChiselAppBar({super.key, this.children = const []});

  @override
  State<ChiselAppBar> createState() => _ChiselAppBarState();
}

class _ChiselAppBarState extends State<ChiselAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      height: 50,
      padding: const EdgeInsets.only(right: 110, left: 20),
      notchMargin: 35,
      child: SizedBox.expand(child: Row(
        textDirection: TextDirection.rtl,
        children: widget.children,
      )),
    );
  }
}

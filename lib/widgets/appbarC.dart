import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarC extends StatelessWidget implements PreferredSizeWidget {
  AppBarC({
    super.key,
    this.leading,
    this.action,
    this.backgroundcolor,
    this.title,
  });

  final Widget? leading;
  final List<Widget>? action;
  final Color? backgroundcolor;
  final title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundcolor ?? Colors.transparent,
      leading: leading ??
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
      actions: action,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

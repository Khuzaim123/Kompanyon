import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onMenuPressed;
  final bool showMenuButton;
  final Color? backgroundColor;
  final Color? titleColor;
  final double elevation;

  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.onMenuPressed,
    this.showMenuButton = true,
    this.backgroundColor,
    this.titleColor,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation,
      leading:
          showMenuButton
              ? IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFF1D2739),
                  size: 24,
                ),
                onPressed: onMenuPressed,
              )
              : null,
      title:
          title != null
              ? Text(
                title!,
                style: TextStyle(
                  color: titleColor ?? const Color(0xFF1D2739),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Satoshi',
                ),
              )
              : null,
      actions: actions,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

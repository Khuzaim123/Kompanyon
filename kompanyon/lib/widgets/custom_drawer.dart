import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback? onClose;
  final List<DrawerItem> items;
  final Widget? header;

  const CustomDrawer({Key? key, this.onClose, required this.items, this.header})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header section
            if (header != null) header!,

            // Navigation items
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _DrawerItemWidget(item: item);
                },
              ),
            ),

            // Footer section
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                '© 2024 Kompanyon',
                style: TextStyle(
                  color: Color(0xFF8A94A6),
                  fontSize: 12,
                  fontFamily: 'Satoshi',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isSelected;
  final Color? iconColor;
  final Color? textColor;

  const DrawerItem({
    required this.title,
    this.icon,
    this.onTap,
    this.isSelected = false,
    this.iconColor,
    this.textColor,
  });
}

class _DrawerItemWidget extends StatelessWidget {
  final DrawerItem item;

  const _DrawerItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        leading:
            item.icon != null
                ? Icon(
                  item.icon,
                  color:
                      item.iconColor ??
                      (item.isSelected
                          ? const Color(0xFF034592)
                          : const Color(0xFF8A94A6)),
                  size: 24,
                )
                : null,
        title: Text(
          item.title,
          style: TextStyle(
            color:
                item.textColor ??
                (item.isSelected
                    ? const Color(0xFF034592)
                    : const Color(0xFF1D2739)),
            fontSize: 16,
            fontWeight: item.isSelected ? FontWeight.w600 : FontWeight.w400,
            fontFamily: 'Satoshi',
          ),
        ),
        onTap: item.onTap,
        selected: item.isSelected,
        selectedTileColor: item.isSelected ? const Color(0xFFF0F4FF) : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}

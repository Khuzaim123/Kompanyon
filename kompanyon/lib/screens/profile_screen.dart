import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_nav_bar.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import '../providers/nav_provider.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4;
  bool _pushNotifications = true;

  void _onNavBarTap(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 2:
        // Add/Create
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/notifications');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);
    final _selectedIndex = navProvider.selectedIndex;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8F6F9), Color(0xFFE6F0FA)],
          ),
        ),
        child: SafeArea(
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'My profile',
                      style: AppTextStyles.h3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Profile card
                    _buildProfileCard(),
                    const SizedBox(height: 24),
                    // Account Info
                    _buildSectionTitle('ACCOUNT INFO'),
                    _buildAccountInfoSection(),
                    const SizedBox(height: 20),
                    // Account Settings
                    _buildSectionTitle('ACCOUNT SETTINGS'),
                    _buildAccountSettingsSection(),
                    const SizedBox(height: 20),
                    // Support
                    _buildSectionTitle('SUPPORT'),
                    _buildSupportSection(),
                    CustomNavBar(
                      selectedIndex: _selectedIndex,
                      onItemSelected: (index) {
                        navProvider.setIndex(index);
                        switch (index) {
                          case 0:
                            Navigator.pushReplacementNamed(context, '/home');
                            break;
                          case 1:
                            Navigator.pushReplacementNamed(context, '/search');
                            break;
                          case 2:
                            // Add/Create
                            break;
                          case 3:
                            Navigator.pushReplacementNamed(
                              context,
                              '/notifications',
                            );
                            break;
                          case 4:
                            Navigator.pushReplacementNamed(context, '/profile');
                            break;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return CustomCard(
      borderRadius: 20,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xFFFFF3E0),
            child: Text(
              profileProvider.fullName.isNotEmpty
                  ? profileProvider.fullName[0]
                  : '',
              style: AppTextStyles.h3.copyWith(color: AppColors.primary),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileProvider.fullName,
                  style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(profileProvider.email, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: AppColors.textTertiary,
              size: 20,
            ),
            onPressed: () => _showEditProfileModal(context, profileProvider),
          ),
        ],
      ),
    );
  }

  void _showEditProfileModal(
    BuildContext context,
    ProfileProvider profileProvider,
  ) {
    final nameController = TextEditingController(
      text: profileProvider.fullName,
    );
    final emailController = TextEditingController(text: profileProvider.email);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: AppColors.textPrimary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Edit profile details',
                      style: AppTextStyles.h3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text('Full name', style: AppTextStyles.label),
                SizedBox(height: 8),
                _buildRoundedTextField('Placeholder', nameController),
                SizedBox(height: 16),
                Text('Email', style: AppTextStyles.label),
                SizedBox(height: 8),
                _buildRoundedTextField('Placeholder', emailController),
                SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 18),
                    ),
                    onPressed: () {
                      profileProvider.updateProfile(
                        nameController.text,
                        emailController.text,
                      );
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 22),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRoundedTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textTertiary,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildAccountInfoSection() {
    return CustomCard(
      borderRadius: 20,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        children: [
          _buildListTile(
            icon: Icons.favorite_border,
            title: 'My Kompanyon Vibe',
            onTap: () {},
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.lock_outline,
            title: 'Change password',
            trailing: const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
            onTap: () {},
          ),
          _buildDivider(),
          ListTile(
            leading: const Icon(
              Icons.notifications_none,
              color: AppColors.primary,
            ),
            title: const Text(
              'Push notifications',
              style: AppTextStyles.bodyMedium,
            ),
            trailing: Switch(
              value: _pushNotifications,
              activeColor: AppColors.primary,
              onChanged: (val) => setState(() => _pushNotifications = val),
            ),
            onTap: null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettingsSection() {
    return CustomCard(
      borderRadius: 20,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        children: [
          _buildListTile(
            icon: Icons.logout,
            title: 'Log out',
            iconColor: AppColors.textTertiary,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/assessment-thankyou');
            },
            trailing: const Icon(
              Icons.logout,
              color: AppColors.textTertiary,
              size: 20,
            ),
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.delete_outline,
            title: 'Delete account',
            iconColor: AppColors.error,
            textColor: AppColors.error,
            onTap: () {},
            trailing: const Icon(
              Icons.delete,
              color: AppColors.error,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return CustomCard(
      borderRadius: 20,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        children: [
          _buildListTile(
            icon: Icons.help_outline,
            title: 'FAQs',
            onTap: () {},
            trailing: const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.phone_outlined,
            title: 'Contact us',
            onTap: () {},
            trailing: const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    Color? iconColor,
    Color? textColor,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? AppColors.primary, size: 22),
      title: Text(
        title,
        style: AppTextStyles.bodyMedium.copyWith(color: textColor),
      ),
      trailing: trailing,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFF0F0F0),
      indent: 8,
      endIndent: 8,
    );
  }
}

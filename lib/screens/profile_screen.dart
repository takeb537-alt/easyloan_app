import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF1A2B2A) : const Color(0xFFF0F4F3);
    final cardBg = isDark ? const Color(0xFF243B39) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white70 : Colors.black54;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, color: textColor, size: 22),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: const Color(0xFF5BA8A0),
                    child: const Icon(Icons.person, color: Colors.white, size: 26),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile header
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundColor: const Color(0xFF5BA8A0),
                          child: const Icon(Icons.person, color: Colors.white, size: 40),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'My Profile',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // User info card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _infoRow('Name:', 'Rahul Sharma', textColor, subTextColor),
                          const SizedBox(height: 8),
                          _infoRow('Email:', 'rahul.sharma@email.com', textColor, subTextColor),
                          const SizedBox(height: 8),
                          _infoRow('Phone:', '+91 9876543210', textColor, subTextColor),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      'Account Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: textColor,
                        fontFamily: 'Nunito',
                      ),
                    ),

                    const SizedBox(height: 12),

                    _detailTile(Icons.medical_services_outlined, 'Account Status:', 'Active (Verified)', cardBg, textColor, subTextColor),
                    const SizedBox(height: 8),
                    _detailTile(Icons.calendar_today_outlined, 'Member Since:', 'Jan 2023', cardBg, textColor, subTextColor),
                    const SizedBox(height: 8),
                    _detailTile(Icons.bar_chart_outlined, 'KYC Status:', 'Completed', cardBg, textColor, subTextColor),

                    const SizedBox(height: 24),

                    Text(
                      'App Settings & Compliance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: textColor,
                        fontFamily: 'Nunito',
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Edit Personal Info
                    _settingsTile(
                      Icons.edit_outlined,
                      'Edit Personal Information',
                      cardBg,
                      textColor,
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: subTextColor),
                      onTap: () {},
                    ),

                    const SizedBox(height: 8),

                    // Dark Mode toggle
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.nightlight_outlined, color: const Color(0xFF5BA8A0), size: 22),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Dark (Night) Mode',
                              style: TextStyle(
                                fontSize: 15,
                                color: textColor,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                          Switch(
                            value: themeProvider.isDark,
                            onChanged: (val) => themeProvider.toggleTheme(val),
                            activeColor: const Color(0xFF5BA8A0),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    _settingsTile(
                      Icons.security_outlined,
                      'Privacy Policy',
                      cardBg,
                      textColor,
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: subTextColor),
                      onTap: () {},
                    ),

                    const SizedBox(height: 8),

                    _settingsTile(
                      Icons.balance_outlined,
                      'Terms & Conditions',
                      cardBg,
                      textColor,
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: subTextColor),
                      onTap: () {},
                    ),

                    const SizedBox(height: 24),

                    // Edit Profile Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SettingsScreen()),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5BA8A0),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Edit Profile, Settings & App Compliance',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, Color textColor, Color subTextColor) {
    return Row(
      children: [
        Text('$label ', style: TextStyle(color: subTextColor, fontFamily: 'Nunito', fontSize: 14)),
        Text(value, style: TextStyle(color: textColor, fontFamily: 'Nunito', fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _detailTile(IconData icon, String label, String value,
      Color cardBg, Color textColor, Color subTextColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF5BA8A0), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(color: textColor, fontFamily: 'Nunito', fontSize: 14),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingsTile(
    IconData icon,
    String label,
    Color cardBg,
    Color textColor, {
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF5BA8A0), size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'Nunito',
                  fontSize: 14,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
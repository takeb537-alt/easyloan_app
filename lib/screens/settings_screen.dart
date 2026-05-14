import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF1A2B2A) : const Color(0xFFEAF3F2);
    final cardBg = isDark ? const Color(0xFF243B39) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white70 : Colors.black45;

    final settings = [
      {
        'icon': Icons.person_outline,
        'color': const Color(0xFFD6E4F0),
        'title': 'Personal Information',
        'subtitle': null,
      },
      {
        'icon': Icons.notifications_outlined,
        'color': const Color(0xFFFFD6D6),
        'title': 'Notification Preferences',
        'subtitle': null,
      },
      {
        'icon': Icons.lock_outline,
        'color': const Color(0xFFD5EDE8),
        'title': 'Security & Passcode',
        'subtitle': null,
      },
      {
        'icon': Icons.language_outlined,
        'color': const Color(0xFFD6E4F0),
        'title': 'Language',
        'subtitle': 'English',
      },
      {
        'icon': Icons.brightness_medium_outlined,
        'color': const Color(0xFFFFF3CD),
        'title': 'App Theme',
        'subtitle': 'Light',
      },
      {
        'icon': Icons.settings_outlined,
        'color': const Color(0xFFE8D5F0),
        'title': 'System Permissions',
        'subtitle': 'Camera, Location, Convention, Lounchay, saturey, etc.',
      },
    ];

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
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios, color: textColor, size: 18),
                        Text('Back',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontFamily: 'Nunito')),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 60),
                ],
              ),
            ),

            // Profile header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFFFFF3CD),
                    child: const Icon(Icons.person, color: Color(0xFF5BA8A0), size: 34),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rahul Sharma',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      Text(
                        'User ID',
                        style: TextStyle(
                          fontSize: 13,
                          color: subTextColor,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
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
                    Text(
                      'Settings & Preferences',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: textColor,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...settings.map((s) {
                      final iconColor = isDark
                          ? (s['color'] as Color).withOpacity(0.25)
                          : s['color'] as Color;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: iconColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    s['icon'] as IconData,
                                    color: const Color(0xFF5BA8A0),
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        s['subtitle'] != null
                                            ? '${s['title']}: '
                                            : s['title'] as String,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: textColor,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      if (s['subtitle'] != null) ...[
                                        Text(
                                          s['subtitle'] as String,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: subTextColor,
                                            fontFamily: 'Nunito',
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    size: 16, color: subTextColor),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),

            // Bottom nav
            _buildBottomNav(isDark, textColor),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(bool isDark, Color textColor) {
    final navBg = isDark ? const Color(0xFF1E3230) : Colors.white;
    return Container(
      color: navBg,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navIcon(Icons.medical_services_outlined, const Color(0xFFD6E4F0), isDark),
          _navIcon(Icons.location_on_outlined, const Color(0xFFD6E4F0), isDark),
          _navIconSelected(Icons.person_outline, 'Profile/Settings'),
          _navIcon(Icons.flight_outlined, const Color(0xFFFFD6D6), isDark),
          _navIcon(Icons.work_outline, const Color(0xFFFFF3CD), isDark),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, Color color, bool isDark) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF243B39) : const Color(0xFFF0F4F3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.grey, size: 22),
    );
  }

  Widget _navIconSelected(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: Color(0xFF5BA8A0),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            color: Color(0xFF5BA8A0),
            fontWeight: FontWeight.w600,
            fontFamily: 'Nunito',
          ),
        ),
      ],
    );
  }
}
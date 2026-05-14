import 'package:flutter/material.dart';
import 'explore_categories_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _selectedAmount = 1000;
  int _bottomIndex = 0;

  final List<Map<String, dynamic>> _loanCards = [
    {
      'title': 'Personal Loan',
      'amount': '₹100',
      'color': Color(0xFFD6E4F0),
      'icon': Icons.monetization_on_outlined,
    },
    {
      'title': 'Personal Loan',
      'amount': '₹500',
      'color': Color(0xFFD5EDE8),
      'icon': Icons.account_balance_wallet_outlined,
    },
    {
      'title': 'Personal Loan',
      'amount': '₹1000',
      'color': Color(0xFFD5EDE8),
      'icon': Icons.money_outlined,
    },
    {
      'title': 'Personal Loan',
      'amount': '₹2000',
      'color': Color(0xFFFFF3CD),
      'icon': Icons.payments_outlined,
    },
  ];

  final List<Map<String, dynamic>> _categories = [
    {'label': 'Medical', 'icon': Icons.medical_services_outlined, 'color': Color(0xFFD6E4F0)},
    {'label': 'Education', 'icon': Icons.school_outlined, 'color': Color(0xFFD5EDE8)},
    {'label': 'Travel', 'icon': Icons.flight_outlined, 'color': Color(0xFFFFD6D6)},
    {'label': 'Business', 'icon': Icons.work_outline, 'color': Color(0xFFFFF3CD)},
  ];

  void _onBottomNav(int index) {
    setState(() => _bottomIndex = index);
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ExploreCategoriesScreen()));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
    } else if (index == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF1A2B2A) : const Color(0xFFF0F4F3);
    final cardBg = isDark ? const Color(0xFF243B39) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white70 : Colors.black54;

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
                  Icon(Icons.menu, color: textColor, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E3230) : const Color(0xFFE8F0EE),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 14),
                          Icon(Icons.search, color: subTextColor, size: 20),
                          const SizedBox(width: 8),
                          Text('Search', style: TextStyle(color: subTextColor, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: const Color(0xFF5BA8A0),
                      child: const Icon(Icons.person, color: Colors.white, size: 26),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        'EasyLoan',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: textColor,
                          fontFamily: 'Nunito',
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Loan Cards Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: _loanCards.length,
                      itemBuilder: (context, i) {
                        final card = _loanCards[i];
                        final cardColor = isDark
                            ? (card['color'] as Color).withOpacity(0.18)
                            : card['color'] as Color;
                        return Container(
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                card['title'],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: textColor.withOpacity(0.7),
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    card['amount'],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                      color: textColor,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  Icon(card['icon'] as IconData,
                                      color: const Color(0xFF5BA8A0), size: 26),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Loan Categories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Loan Categories',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: textColor,
                              fontFamily: 'Nunito',
                            )),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ExploreCategoriesScreen()),
                          ),
                          child: const Text(
                            'Swipe >',
                            style: TextStyle(
                              color: Color(0xFF5BA8A0),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, i) {
                          final cat = _categories[i];
                          final catColor = isDark
                              ? (cat['color'] as Color).withOpacity(0.2)
                              : cat['color'] as Color;
                          return Column(
                            children: [
                              Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  color: catColor,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Icon(cat['icon'] as IconData,
                                    color: const Color(0xFF5BA8A0), size: 32),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                cat['label'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: textColor,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Amount Slider
                    Text('Choose Your Amount',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                          fontFamily: 'Nunito',
                        )),
                    const SizedBox(height: 8),

                    // Amount badge
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF5BA8A0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '₹${_selectedAmount.round()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF5BA8A0),
                        inactiveTrackColor: const Color(0xFFB2DFDB),
                        thumbColor: Colors.white,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayColor: const Color(0x225BA8A0),
                        trackHeight: 4,
                      ),
                      child: Slider(
                        value: _selectedAmount,
                        min: 100,
                        max: 2000,
                        divisions: 19,
                        onChanged: (val) => setState(() => _selectedAmount = val),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('₹100', style: TextStyle(color: subTextColor, fontSize: 12)),
                        Text('₹1000', style: TextStyle(color: subTextColor, fontSize: 12)),
                        Text('₹2000', style: TextStyle(color: subTextColor, fontSize: 12)),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Get Started Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ExploreCategoriesScreen()),
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
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
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

            // Bottom Nav
            _buildBottomNav(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(bool isDark) {
    final navBg = isDark ? const Color(0xFF1E3230) : Colors.white;
    final icons = [
      Icons.medical_services_outlined,
      Icons.location_on_outlined,
      Icons.person_outline,
      Icons.flight_outlined,
      Icons.work_outline,
    ];
    final colors = [
      const Color(0xFFD6E4F0),
      const Color(0xFFD6E4F0),
      const Color(0xFF5BA8A0),
      const Color(0xFFFFD6D6),
      const Color(0xFFFFF3CD),
    ];

    return Container(
      color: navBg,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (i) {
          final isSelected = _bottomIndex == i;
          return GestureDetector(
            onTap: () => _onBottomNav(i),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colors[i]
                        : (isDark ? const Color(0xFF243B39) : const Color(0xFFF0F4F3)),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icons[i],
                      color: isSelected
                          ? (i == 2 ? Colors.white : const Color(0xFF5BA8A0))
                          : Colors.grey,
                      size: 22),
                ),
                if (i == 2)
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      'Profile/Settings',
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xFF5BA8A0),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

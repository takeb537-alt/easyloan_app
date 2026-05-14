import 'package:flutter/material.dart';

class ExploreCategoriesScreen extends StatefulWidget {
  const ExploreCategoriesScreen({super.key});

  @override
  State<ExploreCategoriesScreen> createState() =>
      _ExploreCategoriesScreenState();
}

class _ExploreCategoriesScreenState extends State<ExploreCategoriesScreen> {
  double _selectedAmount = 1000;

  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Business Loans',
      'subtitle': 'Grow Your Business',
      'icon': Icons.work_outline,
      'color': Color(0xFFFFF3CD),
    },
    {
      'title': 'Medical Emergency',
      'subtitle': 'Cover Healthcare Costs',
      'icon': Icons.favorite_border,
      'color': Color(0xFFD6E4F0),
    },
    {
      'title': 'Education Loans',
      'subtitle': 'Invest in Your Future',
      'icon': Icons.school_outlined,
      'color': Color(0xFFD5EDE8),
    },
    {
      'title': 'Travel & Holidays',
      'subtitle': 'Plan Your Next Trip',
      'icon': Icons.flight_outlined,
      'color': Color(0xFFFFF3CD),
    },
    {
      'title': 'Vehicle Loans',
      'subtitle': 'New or Used Cars/Bikes',
      'icon': Icons.directions_car_outlined,
      'color': Color(0xFFE8D5F0),
    },
    {
      'title': 'Home Renovation',
      'subtitle': 'Improve Your Home',
      'icon': Icons.home_outlined,
      'color': Color(0xFFFFD6D6),
    },
    {
      'title': 'Debt Consolidation',
      'subtitle': 'Simplify Your Debts',
      'icon': Icons.credit_card_outlined,
      'color': Color(0xFFD6E4F0),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor =
        isDark ? const Color(0xFF1A2B2A) : const Color(0xFFF0F4F3);
    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white70 : Colors.black54;

    // Build rows: first 2 rows of 2, last row of 3
    final topCategories = _categories.take(4).toList();
    final bottomCategories = _categories.skip(4).toList();

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
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF1E3230)
                            : const Color(0xFFE8F0EE),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 14),
                          Icon(Icons.search, color: subTextColor, size: 20),
                          const SizedBox(width: 8),
                          Text('Search',
                              style:
                                  TextStyle(color: subTextColor, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        'Explore Loan Categories',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: textColor,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Top 4 in 2x2 grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: topCategories.length,
                      itemBuilder: (context, i) =>
                          _categoryCard(topCategories[i], isDark, textColor),
                    ),

                    const SizedBox(height: 12),

                    // Bottom 3 in a row
                    Row(
                      children: bottomCategories
                          .map(
                            (cat) => Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: _categoryCardSmall(
                                    cat, isDark, textColor),
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 28),

                    // Amount section
                    Center(
                      child: Text(
                        'Choose Your Amount',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF5BA8A0),
                        inactiveTrackColor: const Color(0xFFB2DFDB),
                        thumbColor: Colors.white,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayColor: const Color(0x225BA8A0),
                        trackHeight: 4,
                      ),
                      child: Slider(
                        value: _selectedAmount,
                        min: 100,
                        max: 2000,
                        divisions: 19,
                        onChanged: (val) =>
                            setState(() => _selectedAmount = val),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('₹100',
                            style: TextStyle(
                                color: subTextColor, fontSize: 12)),
                        Text('₹1000',
                            style: TextStyle(
                                color: subTextColor, fontSize: 12)),
                        Text('₹2000',
                            style: TextStyle(
                                color: subTextColor, fontSize: 12)),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5BA8A0),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Start with ₹${_selectedAmount.round()}',
                          style: const TextStyle(
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
          ],
        ),
      ),
    );
  }

  Widget _categoryCard(
      Map<String, dynamic> cat, bool isDark, Color textColor) {
    final cardColor = isDark
        ? (cat['color'] as Color).withOpacity(0.18)
        : cat['color'] as Color;
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(cat['icon'] as IconData,
              color: const Color(0xFF5BA8A0), size: 32),
          const Spacer(),
          Text(
            cat['title'],
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: textColor,
              fontFamily: 'Nunito',
            ),
          ),
          Text(
            cat['subtitle'],
            style: TextStyle(
              fontSize: 12,
              color: textColor.withOpacity(0.6),
              fontFamily: 'Nunito',
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCardSmall(
      Map<String, dynamic> cat, bool isDark, Color textColor) {
    final cardColor = isDark
        ? (cat['color'] as Color).withOpacity(0.18)
        : cat['color'] as Color;
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(cat['icon'] as IconData,
              color: const Color(0xFF5BA8A0), size: 26),
          const Spacer(),
          Text(
            cat['title'],
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: textColor,
              fontFamily: 'Nunito',
            ),
          ),
          Text(
            cat['subtitle'],
            style: TextStyle(
              fontSize: 10,
              color: textColor.withOpacity(0.6),
              fontFamily: 'Nunito',
            ),
          ),
        ],
      ),
    );
  }
}
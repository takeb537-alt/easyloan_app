import 'package:flutter/material.dart';

// UI Constants to match screen elements precisely
class UIColors {
  static const Color background = Color(0xFFEAF1F1);
  static const Color accentTeal = Color(0xFF6DAF9A);
  static const Color textMain = Color(0xFF1F1F1F);
  static const Color iconBg = Color(0xFFFFFFFF);
  
  // Loan grid colors (based on image_0.png)
  static const Color grid1 = Color(0xFFE3F2FD); // Light blue
  static const Color grid2 = Color(0xFFE8F5E9); // Light green
  static const Color grid3 = Color(0xFFE1F5FE); // Lighter blue
  static const Color grid4 = Color(0xFFFFF3E0); // Light orange

  // Category card colors (based on image_0.png)
  static const Color catMedical = Color(0xFFD1E3FF);
  static const Color catEducation = Color(0xFFE1FEE6);
  static const Color catTravel = Color(0xFFFFD1D1);
  static const Color catBusiness = Color(0xFFFFECB3);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _currentSliderValue = 1000;
  final double _minLoan = 100;
  final double _maxLoan = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(), // Integrated Drawer
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildSearchBar(),
              const SizedBox(height: 15),
              _buildLargeAppName(),
              const SizedBox(height: 20),
              _buildLoanGrid(),
              const SizedBox(height: 25),
              _buildLoanCategories(),
              const SizedBox(height: 25),
              _buildAmountSlider(),
              const SizedBox(height: 40),
              _buildGetStartedButton(),
            ],
          ),
        ),
      ),
    );
  }

  // --- UI BUILDING BLOCKS ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.menu, size: 28, color: UIColors.textMain),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: UIColors.iconBg,
          // Use user_avatar.png here
          backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 22),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildLargeAppName() {
    return const Center(
      child: Text(
        'EasyLoan',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: UIColors.textMain,
        ),
      ),
    );
  }

  Widget _buildLoanGrid() {
    // Feature implementation using UI from image_0.png
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 1.8, // Rectangular tiles
      children: [
        _buildLoanGridTile(
          color: UIColors.grid1,
          amount: 100,
          label: 'Personal Loan',
          // Use coins_icon.png
          icon: Icons.monetization_on_outlined, 
          isLocked: false,
        ),
        _buildLoanGridTile(
          color: UIColors.grid2,
          amount: 500,
          label: 'Personal Loan',
          // Use cash_hand_icon.png
          icon: Icons.money, 
          isLocked: true, // Example locked based on gradual unlock
        ),
        _buildLoanGridTile(
          color: UIColors.grid3,
          amount: 1000,
          label: 'Personal Loan',
          icon: Icons.money,
          isLocked: true, 
        ),
        _buildLoanGridTile(
          color: UIColors.grid4,
          amount: 2000,
          label: 'Personal Loan',
          icon: Icons.money,
          isLocked: true, 
        ),
      ],
    );
  }

  Widget _buildLoanGridTile({
    required Color color,
    required int amount,
    required String label,
    required IconData icon,
    bool isLocked = false,
  }) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: UIColors.textMain, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹$amount',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: UIColors.textMain),
                  ),
                  Icon(icon, color: Colors.grey[700], size: 28),
                ],
              ),
            ],
          ),
        ),
        if (isLocked)
          Position<Widget>(
            top: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.lock, size: 12, color: Colors.grey),
            ),
          ),
      ],
    );
  }

  Widget _buildLoanCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Loan Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: UIColors.textMain),
            ),
            Row(
              children: [
                Text('Swipe', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const SizedBox(width: 2),
                Icon(Icons.chevron_right, color: Colors.grey[600], size: 14),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryCard(color: UIColors.catMedical, label: 'Medical', icon: Icons.health_and_safety_outlined),
              _buildCategoryCard(color: UIColors.catEducation, label: 'Education', icon: Icons.school_outlined),
              _buildCategoryCard(color: UIColors.catTravel, label: 'Travel', icon: Icons.flight_takeoff),
              _buildCategoryCard(color: UIColors.catBusiness, label: 'Business', icon: Icons.work_outline),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard({required Color color, required String label, required IconData icon}) {
    return Container(
      width: 75,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(child: Icon(icon, color: Colors.grey[800], size: 30)),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12, color: UIColors.textMain, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildAmountSlider() {
    // Custom Slider implementation
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Your Amount',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: UIColors.textMain),
        ),
        const SizedBox(height: 25),
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Custom Track
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: (_currentSliderValue - _minLoan) / (_maxLoan - _minLoan),
                    child: Container(
                      decoration: BoxDecoration(
                        color: UIColors.accentTeal,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Custom Thumb (Draggable)
            Positioned(
              left: ((_currentSliderValue - _minLoan) / (_maxLoan - _minLoan) * (MediaQuery.of(context).size.width - 60)) - 12, // Adjusted for slider width
              top: -10, // Centered vertically
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _currentSliderValue = (_minLoan + (details.localPosition.dx / (MediaQuery.of(context).size.width - 60) * (_maxLoan - _minLoan)))
                        .clamp(_minLoan, _maxLoan);
                  });
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 4)],
                  ),
                ),
              ),
            ),
            // Tooltip (Amount Display above thumb)
            Positioned(
              left: ((_currentSliderValue - _minLoan) / (_maxLoan - _minLoan) * (MediaQuery.of(context).size.width - 60)) - 25, 
              top: -50,
              child: IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: UIColors.accentTeal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '₹${_currentSliderValue.toInt()}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Min/Max Labels below track
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('₹${_minLoan.toInt()}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            Text('₹${_maxLoan.toInt()}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _buildGetStartedButton() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            // Future action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: UIColors.accentTeal,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: const Text(
            'Get Started',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

// --- CUSTOM DRAWER IMPLEMENTATION (Based on image_1.png) ---

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      width: MediaQuery.of(context).size.width * 0.8, // 80% screen width
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildDrawerHeader(context),
              const SizedBox(height: 10),
              _buildDrawerItem(icon: Icons.home_outlined, label: 'Home', isSelected: true),
              _buildDrawerItem(icon: Icons.account_balance_wallet_outlined, label: 'My Loans & Payments'),
              _buildDrawerItem(icon: Icons.calculate_outlined, label: 'Loan Calculator'),
              _buildDrawerItem(icon: Icons.settings_outlined, label: 'Settings & Preferences'),
              _buildDrawerItem(icon: Icons.credit_card_outlined, label: 'Manage Bank Accounts'),
              _buildDrawerItem(icon: Icons.notifications_none, label: 'Notifications'),
              _buildDrawerItem(icon: Icons.support_agent_outlined, label: 'Support & Help'),
              _buildDrawerItem(icon: Icons.info_outline, label: 'About EasyLoan'),
              _buildDrawerItem(icon: Icons.share_outlined, label: 'Invite Friends (Refer & Earn)'),
              const SizedBox(height: 40), // Spacing before Logout
            ],
          ),
          // Logout at the very bottom
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.red[800], size: 24),
                const SizedBox(width: 15),
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.red[800], fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // Close button 'X'
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 20, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30,
            // Use user_avatar.png
            backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Rahul Sharma',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: UIColors.textMain),
              ),
              const SizedBox(height: 3),
              Text(
                'View Profile',
                style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String label, bool isSelected = false}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          // Blue selection bar from image_1.png
          Container(
            width: 4,
            height: 35,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF6DAF9A) : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16), // Padding between bar and item
          Expanded(
            child: InkWell(
              onTap: () {
                // Navigate
              },
              child: Row(
                children: [
                  Icon(icon, color: Colors.black87, size: 22),
                  const SizedBox(width: 15),
                  Text(
                    label,
                    style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

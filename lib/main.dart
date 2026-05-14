import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Screen orientation ko lock karte hain taaki UI na bigde
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(const EasyLoanApp());
}

class EasyLoanApp extends StatelessWidget {
  const EasyLoanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner hata diya
      title: 'EasyLoan',
      theme: ThemeData(
        useMaterialDesign: true,
        scaffoldBackgroundColor: const Color(0xFFEAF1F1),
        // Default font fallback taaki agar custom font na ho toh error na aaye
        primaryColor: const Color(0xFF6DAF9A),
      ),
      // Direct Home Screen call kar rahe hain
      home: const HomeScreen(), 
    );
  }
}

// --- HOME SCREEN & DRAWER INTEGRATED ---
// Isse file missing hone ka dar nahi rahega

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _currentSliderValue = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Custom AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, size: 30),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'EasyLoan',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              
              // Loan Grid (Design from your image)
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1.6,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _loanTile('Personal Loan', '₹100', const Color(0xFFE3F2FD), Icons.savings),
                  _loanTile('Personal Loan', '₹500', const Color(0xFFE8F5E9), Icons.payments),
                  _loanTile('Personal Loan', '₹1000', const Color(0xFFE1F5FE), Icons.account_balance_wallet),
                  _loanTile('Personal Loan', '₹2000', const Color(0xFFFFF3E0), Icons.stars),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Slider Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Choose Your Amount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Slider(
                value: _currentSliderValue,
                min: 100,
                max: 2000,
                divisions: 19,
                activeColor: const Color(0xFF6DAF9A),
                label: '₹${_currentSliderValue.round()}',
                onChanged: (value) {
                  setState(() => _currentSliderValue = value);
                },
              ),
              
              const SizedBox(height: 50),
              
              // Get Started Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6DAF9A),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {},
                  child: const Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loanTile(String title, String amount, Color bg, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(amount, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Icon(icon, size: 24, color: Colors.black54),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text('Rahul Sharma', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            accountEmail: Text('View Profile', style: TextStyle(color: Colors.teal)),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
          ),
          _drawerItem(Icons.home, 'Home'),
          _drawerItem(Icons.history, 'My Loans & Payments'),
          _drawerItem(Icons.calculate, 'Loan Calculator'),
          _drawerItem(Icons.settings, 'Settings'),
          const Divider(),
          _drawerItem(Icons.logout, 'Logout', color: Colors.red),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, {Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      onTap: () {},
    );
  }
}

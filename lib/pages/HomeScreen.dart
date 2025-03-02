import 'package:flutter/material.dart';
import 'BusinessDonation.dart';

class MainDonationPage extends StatelessWidget {
  const MainDonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section: Profile + Logo
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar Image
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/Jaden-headshot.png'),
                  ),
                  const SizedBox(width: 16),
                  // Name + School + Sports
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Text(
                          'Jaden Walton',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'Lovelo',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        // School
                        Text(
                          'LOVELAND',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontFamily: 'Lovelo',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        // Activities
                        Text(
                          'TRACK, Football, Soccer, ...',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                            fontFamily: 'Lovelo',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // School/Team Logo
                  Image.asset(
                    'images/loveland-team.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Team Name
              Center(
                child: Text(
                  'LOVELAND TRACK TEAM',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 23,
                    fontFamily: 'Lovelo',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Fundraising Info
              Text(
                'FUNDRAISING GOAL: \$60,000',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Lovelo',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),

              // Custom Progress Bar
              _FundraisingProgressBar(currentAmount: 13800, goalAmount: 60000),
              const SizedBox(height: 8),

              // Who Are You Title
              const SizedBox(height: 20),
              Text(
                'WHO ARE YOU?',
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Lovelo',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),

              // Business / Individual Buttons
              _RoundedButton(
                label: 'BUSINESS',
                icon: Icons.business_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BusinessDonation()),
                  );
                },
              ),
              const SizedBox(height: 12),
              _RoundedButton(
                label: 'INDIVIDUAL',
                icon: Icons.person_outline,
                onTap: () {},
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      // Bottom NavBar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Trophies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ----- Helper Widgets Below -----

/// Progress bar matching your color scheme (green fill, dark border).
class _FundraisingProgressBar extends StatelessWidget {
  final double currentAmount;
  final double goalAmount;

  const _FundraisingProgressBar({
    Key? key,
    required this.currentAmount,
    required this.goalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = (currentAmount / goalAmount).clamp(0, 1.0);
    final percent = (progress * 100).toStringAsFixed(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom container bar to mimic the “rounded rectangle” style
        Stack(
          children: [
            Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F8E8),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFF00384C),
                  width: 1.5,
                ),
              ),
            ),
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width * progress * 0.85,
              // or any fraction that ensures it fits within your layout
              decoration: BoxDecoration(
                color: const Color(0xFFA4D55D),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            // Center the percent text
            Positioned.fill(
              child: Center(
                child: Text(
                  '$percent%',
                  style: const TextStyle(
                    color: Color(0xFF00384C),
                    fontSize: 14,
                    fontFamily: 'Lovelo',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        // “$13,800 from $60,000 raised”
        Text(
          '\$${currentAmount.toStringAsFixed(0)} from \$${goalAmount.toStringAsFixed(0)} raised',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

/// Simple reusable button for “BUSINESS” / “INDIVIDUAL” sections.
class _RoundedButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _RoundedButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.black),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontSize: 23,
                  fontFamily: 'Lovelo',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            // Right arrow
            Icon(Icons.chevron_right, size: 30, color: Colors.grey[700]),
          ],
        ),
      ),
    );
  }
}



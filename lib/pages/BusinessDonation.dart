import 'package:flutter/material.dart';
import 'BusinessDonation2.dart';

class BusinessDonation extends StatelessWidget {
  const BusinessDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Optional AppBar for the status bar/time. You can adjust or remove as needed.
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      backgroundColor: Colors.white,

      // Option A: Use a custom row of icons at the bottom
      bottomNavigationBar: _buildBottomActionBar(),

      /// The main body wrapped in SafeArea + SingleChildScrollView
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // Profile info at the top
              _buildProfileHeader(),

              const SizedBox(height: 16),

              // Team info
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Loveland Track Team',
                      style: TextStyle(
                        color: const Color(0xFFFF311A),
                        fontSize: 23,
                        fontFamily: 'Lovelo',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  // Team logo (replace with Image.asset if you have a local asset)
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/team-logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Fundraising Goal + Progress
              Text(
                'Fundraising Goal: \$60,000',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Lovelo',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              _FundraisingProgressBar(currentAmount: 13800, goalAmount: 60000),
              const SizedBox(height: 16),

              // "Please select a tier"
              Text(
                'Please select a tier',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'Lovelo',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 16),

              // Tiers
              _buildTierCard(
                backgroundColor: const Color(0xFFFAF2EB),
                tierTitle: 'bronze tier',
                tierTitleColor: const Color(0xFFCD7F32),
                line1: 'Small Logo on T-Sh...',
                line2: 'See more',
              ),
              const SizedBox(height: 11),
              _buildTierCard(
                backgroundColor: const Color(0xFFF1F1F1),
                tierTitle: 'silver tier',
                tierTitleColor: const Color(0xFF767676),
                line1: 'Bronze Tier +',
                line2: 'See more',
              ),
              const SizedBox(height: 11),
              _buildTierCard(
                backgroundColor: const Color(0xFFFDF8E7),
                tierTitle: 'gold tier',
                tierTitleColor: const Color(0xFFEAB70E),
                line1: 'Silver Tier +',
                line2: 'See more',
              ),
              const SizedBox(height: 11),
              InkWell(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusinessDonation2()),
                  );
                },
                child: _buildTierCard(
                  backgroundColor: const Color(0xFFE5F7FB),
                  tierTitle: 'diamond tier',
                  tierTitleColor: const Color(0xFF00B1D9),
                  line1: 'Gold Tier +',
                  line2: 'See more',
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  /// Simple row of icons for the bottom bar
  Widget _buildBottomActionBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_forward_ios, size: 24, color: Colors.blue),
          // const FlutterLogo(size: 32),
          // const FlutterLogo(size: 32),
          // const FlutterLogo(size: 32),
          // const FlutterLogo(size: 32),
        ],
      ),
    );
  }

  /// Profile header with avatar, name, location, sports, etc.
  Widget _buildProfileHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar (replace with Image.asset if you have local images)
        CircleAvatar(
          radius: 39,
          backgroundImage: AssetImage('images/Jaden-headshot.png'),
        ),
        const SizedBox(width: 16),
        // Name, School, Sports
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jaden Walton',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Lovelo',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'LOVELAND',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontFamily: 'Lovelo',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'TRACK, football, soccer, ...',
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
        // Another image on the far right (if needed)
        const SizedBox(width: 8),
        SizedBox(
          width: 51,
          height: 51,
          child: Image.asset(
            'images/loveland-team.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  /// A single Tier Card (Bronze, Silver, Gold, Diamond).
  Widget _buildTierCard({
    required Color backgroundColor,
    required String tierTitle,
    required Color tierTitleColor,
    required String line1,
    required String line2,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Left side: tier text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tierTitle.toUpperCase(),
                  style: TextStyle(
                    color: tierTitleColor,
                    fontSize: 28,
                    fontFamily: 'Lovelo',
                    fontWeight: FontWeight.w900,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  line1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                InkWell(
                  onTap: () {
                    // Show more details or navigate
                  },
                  child: Text(
                    line2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Right side: some small icon or logo
          const SizedBox(width: 16),
          const Icon(Icons.arrow_forward_ios, size: 24, color: Colors.blue),
        ],
      ),
    );
  }
}

/// A re-usable widget for the “Fundraising Goal” progress bar
/// (same as shown in the first page refinement).
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
        // Custom container bar
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
              width: MediaQuery.of(context).size.width * 0.8 * progress,
              // Adjust factor (0.8) to your layout needs
              decoration: BoxDecoration(
                color: const Color(0xFFA4D55D),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
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
        Text(
          '\$${currentAmount.toStringAsFixed(0)} from \$${goalAmount.toStringAsFixed(0)} raised',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontFamily: 'Open Sans',
          ),
        ),
      ],
    );
  }
}




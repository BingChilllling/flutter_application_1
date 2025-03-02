import 'package:flutter/material.dart';

class BusinessDonation2 extends StatelessWidget {
  const BusinessDonation2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Optional app bar to house the time, signal, battery, etc.
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // e.g. Navigator.pop(context);
          },
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,

      // Bottom area with icons
      bottomNavigationBar: _buildBottomBar(),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            // Profile Section
            _buildProfileHeader(),
            const SizedBox(height: 16),

            // Main image (the 322x530 placeholder in your original code)
            _buildLargeCenterImage(),

            const SizedBox(height: 16),

            // Example decorative circle icons from your original code
            _buildDecorativeCircles(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  /// Bottom bar with icons (or any widgets you want).
  Widget _buildBottomBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Replace these with your actual icons or remove them if not needed
          Icon(Icons.home_outlined, size: 32, color: Colors.black),
          Icon(Icons.calendar_today_outlined, size: 32, color: Colors.black),
          Icon(Icons.favorite_outline, size: 32, color: Colors.black),
          Icon(Icons.shopping_bag_outlined, size: 32, color: Colors.black),
          Icon(Icons.person_outline, size: 32, color: Colors.black),
        ],
      ),
    );
  }

  /// Profile header with user image, name, location, sports, etc.
  Widget _buildProfileHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: User avatar
        CircleAvatar(
          radius: 39,
          backgroundImage: AssetImage('images/Jaden-headshot.png'),
        ),
        const SizedBox(width: 16),
        // Middle: Info
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
        // Right: A second logo or image if needed
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

  /// The large 322x530 image from your code
  Widget _buildLargeCenterImage() {
    return Container(
      // Constrain the height or let it size naturally
      height: 530,
      width: double.infinity, // Make it fill the horizontal space,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/Chipotle-sponsor.png'),
          fit: BoxFit.contain, // Ensure the whole image is included
        ),
      ),
    );
  }

  /// Demonstration of the two circle decorations with transformations
  /// that were previously absolutely positioned.
  Widget _buildDecorativeCircles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // First circle (rotated 3.14)
        Transform.rotate(
          angle: 3.14,
          child: Container(
            width: 60,
            height: 60,
            decoration: ShapeDecoration(
              shape: const CircleBorder(
                side: BorderSide(width: 2, color: Colors.black),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Icon(Icons.download, size: 24, color: Colors.black),
              // or remove if you don't need an icon in the circle
            ),
          ),
        ),

        // Second circle, smaller icon inside
        Container(
          width: 60,
          height: 60,
          decoration: const ShapeDecoration(
            shape: CircleBorder(side: BorderSide(width: 2, color: Colors.black)),
          ),
          child: Center(
            child: Icon(Icons.share, size: 24, color: Colors.black),
            // or remove if you don't need an icon in the circle
          ),
        ),
      ],
    );
  }
}
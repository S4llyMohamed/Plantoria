import 'package:flutter/material.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar with Logo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Logo in top left
                  Image.asset('assets/logo.png', height: 40),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // GrowBot logo image instead of the custom widget
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background circles/bubbles
                      Positioned(top: -30, right: 70, child: _buildBubble(12)),
                      Positioned(top: 10, left: 100, child: _buildBubble(15)),
                      Positioned(top: 50, right: 100, child: _buildBubble(20)),
                      Positioned(
                        bottom: -20,
                        left: 80,
                        child: _buildBubble(25),
                      ),
                      Positioned(
                        right: 60,
                        bottom: 30,
                        child: _buildBubble(15),
                      ),
                      Positioned(left: 60, top: -40, child: _buildBubble(18)),
                      Positioned(
                        left: -20,
                        bottom: 40,
                        child: _buildBubble(30),
                      ),
                      Positioned(right: -10, top: 70, child: _buildBubble(25)),

                      // Main logo using image
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Image.asset(
                          'assets/chat.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome, User',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Let's start a conversation with GrowBot",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffB8ED8C),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // TODO: Start conversation with GrowBot
                        },
                        child: const Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom navigation bar
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xffB8ED8C),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.pop(context); // Go back to home
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      // Camera functionality
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.spa,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        // Already on this page
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      // Notifications
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create bubble widgets
  Widget _buildBubble(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xffB8ED8C),
        shape: BoxShape.circle,
      ),
    );
  }
}

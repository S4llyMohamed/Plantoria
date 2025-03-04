import 'package:flutter/material.dart';
import 'package:plantoria/widgets/plant_card.dart';
import 'package:plantoria/screens/details_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Logo and app name
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  Image.asset('assets/logo.png', height: 30),
                  const SizedBox(width: 10),
                  const Text(
                    'Plantoria',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff9AE66E),
                    ),
                  ),
                ],
              ),
            ),

            // Plant cards grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  children: [
                    PlantCard(
                      imagePath: 'assets/tomato.png',
                      plantName: 'Tomato',
                      onTap: () {
                        _showPlantDialog(
                          context,
                          'assets/tomato.png',
                          'Tomato',
                        );
                      },
                    ),
                    PlantCard(
                      imagePath: 'assets/strawberry.jpg',
                      plantName: 'Strawberry',
                      onTap: () {
                        _showPlantDialog(
                          context,
                          'assets/strawberry.jpg',
                          'Strawberry',
                        );
                      },
                    ),
                    PlantCard(
                      imagePath: 'assets/soybean.png',
                      plantName: 'Soybean',
                      onTap: () {
                        _showPlantDialog(
                          context,
                          'assets/soybean.png',
                          'Soybean',
                        );
                      },
                    ),
                    PlantCard(
                      imagePath: 'assets/pepper.png',
                      plantName: 'Pepper',
                      onTap: () {
                        _showPlantDialog(
                          context,
                          'assets/pepper.png',
                          'Pepper',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Add button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: FloatingActionButton(
                  onPressed: () {
                    // Add new plant
                  },
                  backgroundColor: const Color(0xffB8ED8C),
                  mini: false,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
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
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.spa, color: Colors.white, size: 28),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the plant dialog
  void _showPlantDialog(
    BuildContext context,
    String imagePath,
    String plantName,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Plant image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    height: 120,
                    width: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                // Show details button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB8ED8C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog

                      // Navigate to details page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => PlantDetailsPage(
                                imagePath: imagePath,
                                plantName: plantName,
                              ),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Show details',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Delete crop button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB8ED8C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Add delete functionality
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Delete crop',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
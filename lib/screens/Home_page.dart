import 'package:flutter/material.dart';
import 'package:plantoria/screens/chatbot_page.dart';
import 'package:plantoria/screens/select_plants_screen.dart';
import 'package:plantoria/widgets/plant_card.dart';
import 'package:plantoria/screens/details_screen.dart';

class HomePage extends StatefulWidget {
  final List<String> selectedPlants;

  // Updated constructor to accept selected plants
  const HomePage({super.key, required this.selectedPlants});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a mutable list to manage selected plants
  late List<String> _currentPlants;

  @override
  void initState() {
    super.initState();
    // Initialize with the passed in selected plants
    _currentPlants = List.from(widget.selectedPlants);
  }

  // Map of all available plants with their image paths
  final Map<String, String> plantImages = {
    'Tomato': 'assets/tomato.png',
    'Strawberry': 'assets/strawberry.jpg',
    'Soybean': 'assets/soybean.png',
    'Pepper': 'assets/pepper.png',
    'grabe': 'assets/grabe.jpeg',
    'Cucumber': 'assets/cucumber.jpeg',
    'Basil': 'assets/mint.jpeg',
    'Spinach': 'assets/cherry.jpeg',
  };

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

            // Plant cards grid - now using selected plants
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child:
                    _currentPlants.isEmpty
                        ? const Center(
                          child: Text(
                            'No plants selected. Go back and select some plants.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                        : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.9,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                          itemCount: _currentPlants.length,
                          itemBuilder: (context, index) {
                            final plantName = _currentPlants[index];
                            final imagePath =
                                plantImages[plantName] ?? 'assets/logo.png';

                            return PlantCard(
                              imagePath: imagePath,
                              plantName: plantName,
                              onTap: () {
                                _showPlantDialog(context, imagePath, plantName);
                              },
                            );
                          },
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectPlantsPage(),
                      ),
                    );
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
                    icon: const Icon(Icons.chat, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatbotPage()),
                      );
                    },
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
                      Navigator.pop(context); // Close the current dialog
                      _showDeleteConfirmationDialog(
                        context,
                        plantName,
                      ); // Show confirmation dialog
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

  // Function to show delete confirmation dialog
  void _showDeleteConfirmationDialog(BuildContext context, String plantName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Delete $plantName',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure you want to delete $plantName from your plants?',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xff9AE66E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Delete the plant
                setState(() {
                  _currentPlants.remove(plantName);
                });
                Navigator.pop(context); // Close the dialog

                // Show a snackbar to confirm deletion
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$plantName has been deleted'),
                    backgroundColor: const Color(0xff9AE66E),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

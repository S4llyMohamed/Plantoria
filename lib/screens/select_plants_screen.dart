import 'package:flutter/material.dart';
import 'package:plantoria/screens/Home_page.dart';
import 'package:plantoria/widgets/plant_card.dart';

class SelectPlantsPage extends StatefulWidget {
  const SelectPlantsPage({super.key});

  @override
  State<SelectPlantsPage> createState() => _SelectPlantsPageState();
}

class _SelectPlantsPageState extends State<SelectPlantsPage> {
  // List to track selected plants
  List<String> selectedPlants = [];

  // List of all available plants
  final List<Map<String, dynamic>> availablePlants = [
    {'name': 'Tomato', 'image': 'assets/tomato.png'},
    {'name': 'Strawberry', 'image': 'assets/strawberry.jpg'},
    {'name': 'Soybean', 'image': 'assets/soybean.png'},
    {'name': 'Pepper', 'image': 'assets/pepper.png'},
    {'name': 'grabe', 'image': 'assets/grabe.jpeg'},
    {'name': 'Cucumber', 'image': 'assets/cucumber.jpeg'},
    {'name': 'Mint', 'image': 'assets/mint.jpeg'},
    {'name': 'Cherry', 'image': 'assets/cherry.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
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
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Title and description
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Select Plants',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Choose the plants you want to monitor',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),

          // Plants grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: availablePlants.length,
                itemBuilder: (context, index) {
                  final plant = availablePlants[index];
                  final isSelected = selectedPlants.contains(plant['name']);

                  return Stack(
                    children: [
                      PlantCard(
                        imagePath: plant['image'],
                        plantName: plant['name'],
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedPlants.remove(plant['name']);
                            } else {
                              selectedPlants.add(plant['name']);
                            }
                          });
                        },
                      ),
                      if (isSelected)
                        Positioned(
                          right: 15,
                          top: 15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff9AE66E),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),

          // Continue button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff9AE66E),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed:
                    selectedPlants.isNotEmpty
                        ? () {
                          // Navigate to home page with selected plants
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      HomePage(selectedPlants: selectedPlants),
                            ),
                          );
                        }
                        : null,
                child: const Text(
                  'Continue',
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
    );
  }
}

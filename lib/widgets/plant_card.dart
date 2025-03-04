import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final String imagePath;
  final String plantName;
  final VoidCallback? onTap;

  const PlantCard({
    super.key,
    required this.imagePath,
    required this.plantName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Image with rounded corners
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Plant name
            Text(
              plantName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
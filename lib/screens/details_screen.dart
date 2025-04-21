import 'package:flutter/material.dart';
import 'package:plantoria/screens/chatbot_page.dart';
import 'package:plantoria/widgets/sensor_card.dart';

class PlantDetailsPage extends StatelessWidget {
  final String imagePath;
  final String plantName;

  const PlantDetailsPage({
    super.key,
    required this.imagePath,
    required this.plantName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff9AE66E)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          plantName,
          style: TextStyle(
            color: Color(0xff9AE66E),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plant image
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.all(16),
            ),

            // Sensors Readings heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sensors Readings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(thickness: 1),
                ],
              ),
            ),

            // Sensor cards grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    // First row
                    SensorCard(
                      title: 'Temperature',
                      value: '35 °C',
                      icon: Icons.thermostat,
                      valueColor: Colors.red,
                    ),
                    SensorCard(
                      title: 'Intensity',
                      value: '2000 Lux',
                      icon: Icons.wb_sunny,
                      valueColor: Colors.green,
                    ),

                    // Second row
                    SensorCard(
                      title: 'Humidity',
                      value: '60 %',
                      icon: Icons.water_drop,
                      valueColor: Colors.green,
                    ),
                    SensorCard(
                      title: 'Water PH',
                      value: '6.5',
                      icon: Icons.water,
                      valueColor: Colors.red,
                    ),

                    // Third row
                    SensorCard(
                      title: 'Water level',
                      value: '5 cm',
                      icon: Icons.height,
                      valueColor: Colors.red,
                    ),
                    SensorCard(
                      title: 'Nutrient',
                      value: '1500 ppm',
                      icon: Icons.spa,
                      valueColor: Colors.green,
                    ),

                    // Fourth row
                    SensorCard(
                      title: 'Turbidity',
                      value: '3 NTU',
                      icon: Icons.opacity,
                      valueColor: Colors.green,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8FFCC),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.air,
                                size: 20,
                                color: Colors.black87,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Fan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'pump',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Switch(
                                value: false,
                                onChanged: (value) {},
                                activeColor: const Color(0xff9AE66E),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
                    icon: const Icon(Icons.home, color: Colors.black, size: 28),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/chatbotIcon .png',
                      width: 28,
                      height: 28,
                    ),
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
                      color: Colors.black,
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
}

import 'package:flutter/material.dart';
import '../weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController cityController =
      TextEditingController();

  final WeatherService weatherService = WeatherService();

  String city = 'Uyo';
  String temperature = '--°C';
  String condition = 'Search for a city';
  String humidity = '--%';
  String wind = '-- km/h';

  bool loading = false;

  Future<void> searchWeather() async {
    final enteredCity = cityController.text.trim();

    if (enteredCity.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a city'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final data = await weatherService.getWeather(enteredCity);

      setState(() {
        city = data['name'];
        temperature =
            '${data['main']['temp'].round()}°C';
        condition =
            data['weather'][0]['description'];
        humidity =
            '${data['main']['humidity']}%';
        wind =
            '${data['wind']['speed']} km/h';

        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'City not found. Please check the city name.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // SEARCH BOX
            TextField(
              controller: cityController,

              textInputAction: TextInputAction.search,

              onSubmitted: (_) {
                searchWeather();
              },

              decoration: InputDecoration(
                hintText: 'Enter city name',

                prefixIcon: const Icon(
                  Icons.location_city,
                ),

                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),

                  onPressed: searchWeather,
                ),

                border: const OutlineInputBorder(),

                filled: true,
              ),
            ),

            const SizedBox(height: 30),

            if (loading)
              const CircularProgressIndicator()
            else ...[
              // CITY
              Text(
                city,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // WEATHER ICON
              const Icon(
                Icons.cloud,
                size: 90,
              ),

              const SizedBox(height: 15),

              // TEMPERATURE
              Text(
                temperature,
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // CONDITION
              Text(
                condition,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 30),

              // WEATHER DETAILS
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,

                children: [
                  weatherDetail(
                    Icons.water_drop,
                    'Humidity',
                    humidity,
                  ),

                  weatherDetail(
                    Icons.air,
                    'Wind',
                    wind,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget weatherDetail(
    IconData icon,
    String title,
    String value,
  ) {
    return Column(
      children: [
        Icon(icon, size: 30),

        const SizedBox(height: 5),

        Text(title),

        const SizedBox(height: 3),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

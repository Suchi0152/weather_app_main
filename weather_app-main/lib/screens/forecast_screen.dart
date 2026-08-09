import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> forecast = [

      {
        'day': 'Monday',
        'date': 'Jun 10',
        'low': '23°',
        'high': '30°',
      },

      {
        'day': 'Tuesday',
        'date': 'Jun 11',
        'low': '22°',
        'high': '29°',
      },

      {
        'day': 'Wednesday',
        'date': 'Jun 12',
        'low': '21°',
        'high': '28°',
      },

      {
        'day': 'Thursday',
        'date': 'Jun 13',
        'low': '20°',
        'high': '27°',
      },

      {
        'day': 'Friday',
        'date': 'Jun 14',
        'low': '21°',
        'high': '28°',
      },

      {
        'day': 'Saturday',
        'date': 'Jun 15',
        'low': '22°',
        'high': '29°',
      },

      {
        'day': 'Sunday',
        'date': 'Jun 16',
        'low': '23°',
        'high': '30°',
      },
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          '7-Day Forecast',
        ),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(15),

        itemCount: forecast.length,

        itemBuilder: (context, index) {

          final weather = forecast[index];

          return Card(

            margin: const EdgeInsets.only(
              bottom: 12,
            ),

            child: Padding(
              padding: const EdgeInsets.all(15),

              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          weather['day']!,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          weather['date']!,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.cloud,
                    size: 35,
                  ),

                  const SizedBox(width: 25),

                  Text(
                    weather['low']!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Text(
                    weather['high']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade400,
              Colors.blue.shade600,
              Colors.blue.shade800,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Header
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cuaca Hari Ini',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white70,
                                size: 18,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Jakarta, Indonesia',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert, color: Colors.white, size: 28),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Main Weather Display
                  Center(
                    child: Column(
                      children: [
                        // Weather Icon
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                size: 120,
                                color: Colors.yellow.shade300,
                              ),
                              Positioned(
                                right: 40,
                                top: 30,
                                child: Icon(
                                  Icons.cloud,
                                  size: 60,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Temperature
                        const Text(
                          '28°C',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Weather Description
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Cerah Berawan',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Terakhir diperbarui: 14:30 WIB',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Weather Details Cards
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildWeatherDetail(
                              icon: Icons.water_drop,
                              label: 'Kelembapan',
                              value: '65%',
                              color: Colors.lightBlue.shade200,
                            ),
                            Container(
                              width: 1,
                              height: 60,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            _buildWeatherDetail(
                              icon: Icons.air,
                              label: 'Kec. Angin',
                              value: '12 km/h',
                              color: Colors.cyan.shade200,
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Divider(color: Colors.white.withOpacity(0.3)),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildWeatherDetail(
                              icon: Icons.visibility,
                              label: 'Jarak Pandang',
                              value: '10 km',
                              color: Colors.white70,
                            ),
                            Container(
                              width: 1,
                              height: 60,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            _buildWeatherDetail(
                              icon: Icons.compress,
                              label: 'Tekanan',
                              value: '1013 mb',
                              color: Colors.amber.shade200,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Forecast Section
                  const Text(
                    'Prakiraan 7 Hari',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Daily Forecast Cards
                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildDailyForecast(
                          'Sen',
                          Icons.wb_sunny,
                          '30°',
                          '22°',
                        ),
                        _buildDailyForecast('Sel', Icons.cloud, '28°', '21°'),
                        _buildDailyForecast(
                          'Rab',
                          Icons.wb_cloudy,
                          '27°',
                          '20°',
                        ),
                        _buildDailyForecast(
                          'Kam',
                          Icons.thunderstorm,
                          '25°',
                          '19°',
                        ),
                        _buildDailyForecast(
                          'Jum',
                          Icons.wb_sunny,
                          '29°',
                          '21°',
                        ),
                        _buildDailyForecast(
                          'Sab',
                          Icons.wb_sunny,
                          '31°',
                          '23°',
                        ),
                        _buildDailyForecast('Min', Icons.cloud, '28°', '22°'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Additional Info
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.wb_twilight,
                              color: Colors.orange.shade200,
                              size: 32,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Matahari Terbit',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '05:45',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 60,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.nightlight_round,
                              color: Colors.indigo.shade200,
                              size: 32,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Matahari Terbenam',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '18:20',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetail({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 36),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDailyForecast(
    String day,
    IconData icon,
    String maxTemp,
    String minTemp,
  ) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(icon, color: Colors.yellow.shade200, size: 36),
          Text(
            maxTemp,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            minTemp,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

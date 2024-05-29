import 'package:flutter/material.dart';
import 'booking_details_screen.dart';

class FlightSearchScreen extends StatelessWidget {
  final String from;
  final String to;
  final String departureDate;
  final int travelers;

  FlightSearchScreen({
    required this.from,
    required this.to,
    required this.departureDate,
    required this.travelers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Flights',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0064D2),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/arrow left.png',
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xFF0064D2),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            FlightCard(
              from: from,
              to: to,
              departureTime: '8:00 AM',
              arrivalTime: '7:00 AM',
              duration: '23:00',
              date: departureDate,
              airline: 'Qatar Airways',
              price: 340.0,
              travelers: travelers,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingDetailsScreen(
                      from: from,
                      to: to,
                      departureDate: departureDate,
                      travelers: travelers,
                    ),
                  ),
                );
              },
            ),
            // Additional FlightCard widgets can be added here if needed
          ],
        ),
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  final String from;
  final String to;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String date;
  final String airline;
  final double price;
  final int travelers;
  final VoidCallback onTap;

  const FlightCard({
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.date,
    required this.airline,
    required this.price,
    required this.travelers,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          from,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '8:00 AM',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      'assets/images/flight_trip_icon.png',
                      height: 48, // Besarkan ukuran gambar
                      width: 48, // Besarkan ukuran gambar
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          to,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '7:00 AM',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Letakkan duration ditengah
                children: [
                  Text(
                    '23:00',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    airline,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '\$$price',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
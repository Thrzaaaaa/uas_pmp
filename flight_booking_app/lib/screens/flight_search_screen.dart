import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for currency formatting
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
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: 3, // Set the number of tickets to display
          itemBuilder: (context, index) {
            return FlightCard(
              from: from,
              to: to,
              departureTime: '8:00 AM',
              arrivalTime: '7:00 AM',
              duration: '2j 0m',
              date: departureDate,
              airline: 'Lion Air',
              price: 1562382.0, // Price in Indonesian Rupiah
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
            );
          },
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
    // Format the price to Indonesian Rupiah
    final formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'IDR').format(price);

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          from,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Text(
                          departureTime,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/flight_trip_icon.png',
                        height: 100, // Adjust size as needed
                        width: 100,  // Adjust size as needed
                        color: Colors.blue,
                      ),
                      Text(
                        duration,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          to,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Text(
                          arrivalTime,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
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
                    formattedPrice, // Display the formatted price
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

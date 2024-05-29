import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  final String flightDetails;
  final double price;
  final VoidCallback onTap;

  FlightCard({required this.flightDetails, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(flightDetails),
        subtitle: Text('\$${price.toString()}'),
        onTap: onTap,
      ),
    );
  }
}

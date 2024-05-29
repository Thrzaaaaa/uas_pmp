import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlightSearchScreen(),
    );
  }
}

class FlightSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Search'),
        backgroundColor: Color(0xFF0064D2),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingDetailsScreen(
                  from: 'New York',
                  to: 'London',
                  departureDate: '2024-06-15',
                  travelers: 2,
                ),
              ),
            );
          },
          child: Text('Search Flights'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0064D2),
            minimumSize: Size(200, 50),
          ),
        ),
      ),
    );
  }
}

class BookingDetailsScreen extends StatelessWidget {
  final String from;
  final String to;
  final String departureDate;
  final int travelers;

  BookingDetailsScreen({
    required this.from,
    required this.to,
    required this.departureDate,
    required this.travelers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FlightSearchScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/arrow_left.png', width: 24, height: 24),
              ),
            ),
            Text(
              'Booking Details',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color(0xFF0064D2),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: $from',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'To: $to',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Departure Date: $departureDate',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Travelers: $travelers',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ContactDetailsSection(),
            SizedBox(height: 16),
            PassengerInfoSection(),
            SizedBox(height: 16),
            FacilitySection(),
            SizedBox(height: 16),
            ExtraProtectionSection(),
            SizedBox(height: 16),
            TotalSection(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle select seat action
              },
              child: Text('Select Seat'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0064D2),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactDetailsSection extends StatefulWidget {
  @override
  _ContactDetailsSectionState createState() => _ContactDetailsSectionState();
}

class _ContactDetailsSectionState extends State<ContactDetailsSection> {
  String _fullName = 'Matt Murdock';
  String _email = 'imnotdaredevil@gmail.com';
  String _phone = '+6281232233922';

  void _updateContactDetails(String fullName, String email, String phone) {
    setState(() {
      _fullName = fullName;
      _email = email;
      _phone = phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ListTile(
          title: Text(_fullName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_email),
              Text(_phone),
            ],
          ),
          trailing: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailsScreen(
                    fullName: _fullName,
                    email: _email,
                    phone: _phone,
                    onSave: _updateContactDetails,
                  ),
                ),
              );
            },
            child: Text('Edit'),
          ),
        ),
      ],
    );
  }
}

class ContactDetailsScreen extends StatefulWidget {
  final String fullName;
  final String email;
  final String phone;
  final Function(String, String, String) onSave;

  ContactDetailsScreen({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.onSave,
  });

  @override
  _ContactDetailsScreenState createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _emailController = TextEditingController(text: widget.email);
    _phoneController = TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    widget.onSave(
      _fullNameController.text,
      _emailController.text,
      _phoneController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
        backgroundColor: Color(0xFF0064D2),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Save changes', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0064D2),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PassengerInfoSection extends StatefulWidget {
  @override
  _PassengerInfoSectionState createState() => _PassengerInfoSectionState();
}

class _PassengerInfoSectionState extends State<PassengerInfoSection> {
  bool _sameAsContactDetails = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Passenger Info', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ListTile(
          title: Text('Same As Contact Details'),
          trailing: Switch(
            value: _sameAsContactDetails,
            onChanged: (value) {
              setState(() {
                _sameAsContactDetails = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Selena Kayle'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PassengerInfoScreen()),
            );
          },
        ),
      ],
    );
  }
}

class PassengerInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passenger Info'),
        backgroundColor: Color(0xFF0064D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PassengerForm(),
          ],
        ),
      ),
    );
  }
}

class PassengerForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Full Name',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email Address',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'ID Card Number',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Handle save action
          },
          child: Text('Save changes'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0064D2),
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ],
    );
  }
}

class FacilitySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Facility', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ListTile(
          title: Text('Baggage'),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBaggageScreen()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AddBaggageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Baggage'),
        backgroundColor: Color(0xFF0064D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BaggageOption(),
          ],
        ),
      ),
    );
  }
}

class BaggageOption extends StatefulWidget {
  @override
  _BaggageOptionState createState() => _BaggageOptionState();
}

class _BaggageOptionState extends State<BaggageOption> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedOption = 0;
                });
              },
              child: Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value as int;
                      });
                    },
                  ),
                  Text('0Kg'),
                ],
              ),
            ),
            Text('Free'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedOption = 1;
                });
              },
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value as int;
                      });
                    },
                  ),
                  Text('5Kg'),
                ],
              ),
            ),
            Text('Rp 210.000'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedOption = 2;
                });
              },
              child: Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value as int;
                      });
                    },
                  ),
                  Text('10Kg'),
                ],
              ),
            ),
            Text('Rp 510.000'),
          ],
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Handle add baggage action
          },
          child: Text('Add Baggage'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0064D2),
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ],
    );
  }
}

class ExtraProtectionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Extra Protection', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ListTile(
          title: Text('Travel Insurance'),
          subtitle: Text('\$125\nCoverage for Accidents up to \$10000\nCoverage for trip cancellation by passengers up to \$1250'),
        ),
      ],
    );
  }
}

class TotalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Subtotal: \$132', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

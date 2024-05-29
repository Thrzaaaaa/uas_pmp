import 'package:flutter/material.dart';
import 'flight_search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> cities = [
    'Jakarta',
    'Surabaya',
    'Bandung',
    'Medan',
    'Semarang',
    'Makassar',
    'Palembang',
    'Bali',
    'Yogyakarta',
    'Aceh',
    'Kupang',
  ];

  String selectedCityFrom = '';
  String selectedCityTo = '';
  DateTime selectedDate = DateTime.now();
  int adults = 1;
  int children = 0;
  int infants = 0;
  String travelClass = 'Economy';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF0064D2),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showTravelersDialog(BuildContext context) {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Travelers',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildTravelerCountRow(
                          'Adults (12+)',
                          adults,
                          (value) {
                            setModalState(() {
                              adults = value;
                            });
                            _saveTravelerData();
                          },
                        ),
                        _buildTravelerCountRow(
                          'Children (2-11)',
                          children,
                          (value) {
                            setModalState(() {
                              children = value;
                            });
                            _saveTravelerData();
                          },
                        ),
                        _buildTravelerCountRow(
                          'Infants (under 2)',
                          infants,
                          (value) {
                            setModalState(() {
                              infants = value;
                            });
                            _saveTravelerData();
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Class',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildClassOption('Economy', travelClass, (value) {
                          setModalState(() {
                            travelClass = value!;
                          });
                          _saveTravelerData();
                        }),
                        _buildClassOption('Premium Economy', travelClass, (value) {
                          setModalState(() {
                            travelClass = value!;
                          });
                          _saveTravelerData();
                        }),
                        _buildClassOption('Business', travelClass, (value) {
                          setModalState(() {
                            travelClass = value!;
                          });
                          _saveTravelerData();
                        }),
                        _buildClassOption('First', travelClass, (value) {
                          setModalState(() {
                            travelClass = value!;
                          });
                          _saveTravelerData();
                        }),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _saveTravelerData() {
    print('Traveler data saved');
  }

  Widget _buildTravelerCountRow(String label, int count, Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: count > 0 ? () => onChanged(count - 1) : null,
            ),
            Text(count.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => onChanged(count + 1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildClassOption(String label, String groupValue, Function(String?) onChanged) {
    return ListTile(
      title: Text(label),
      leading: Radio<String>(
        value: label,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF0064D2),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/arrow left.png',
            color: Colors.white,
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Search Flights',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF0064D2),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover\na new world',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildLabeledAutocompleteField(
                    icon: 'assets/images/flight_take off.png',
                    label: 'From',
                    hintText: 'Enter city name',
                    suggestions: cities,
                    onSelected: (String selected) {
                      setState(() {
                        selectedCityFrom = selected;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  _buildLabeledAutocompleteField(
                    icon: 'assets/images/flight_landing.png',
                    label: 'To',
                    hintText: 'Enter city name',
                    suggestions: cities,
                    onSelected: (String selected) {
                      setState(() {
                        selectedCityTo = selected;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  _buildLabeledDateField(
                    icon: 'assets/images/calendar.png',
                    label: 'Departure Date',
                    hint: 'Select Date',
                    selectedDate: selectedDate,
                    onTap: () => _selectDate(context),
                  ),
                  SizedBox(height: 10),
                  _buildLabeledTextField(
                    icon: 'assets/images/passenger.png',
                    label: 'Travelers',
                    hint: '$adults Adult${adults > 1 ? 's' : ''}, $children Child${children > 1 ? 'ren' : ''}, $infants Infant${infants > 1 ? 's' : ''}, $travelClass',
                    onTap: () => _showTravelersDialog(context),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FlightSearchScreen(
                            from: selectedCityFrom,
                            to: selectedCityTo,
                            departureDate: selectedDate.toString(),
                            travelers: adults + children + infants,
                          )),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Search Flights',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0064D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedItemColor: Color(0xFF0064D2),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildLabeledTextField({required String icon, required String label, required String hint, required Function() onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          child: InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(icon, width: 24, height: 24),
              ),
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              hint,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabeledDateField({required String icon, required String label, required String hint, required DateTime selectedDate, required Function() onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          child: InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(icon, width: 24, height: 24),
              ),
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabeledAutocompleteField({required String icon, required String label, required String hintText, required List<String> suggestions, required Function(String) onSelected}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 6),
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return [];
            }
            return suggestions.where((option) => option.toLowerCase().contains(textEditingValue.text.toLowerCase())).toList();
          },
          onSelected: onSelected,
          fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
            return TextFormField(
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(icon, width: 24, height: 24),
                ),
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          },
          displayStringForOption: (String option) => option,
        ),
      ],
    );
  }
}
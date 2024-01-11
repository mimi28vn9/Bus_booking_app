import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'TIME SAVING BUS BOOKING APP',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.lightBlue[700],
        ),
        body: Container(
          color: Colors.grey[200],
          child: Center(
            child: FlightSearchForm(),
          ),
        ),
      ),
    );
  }
}

class FlightSearchForm extends StatefulWidget {
  @override
  _FlightSearchFormState createState() => _FlightSearchFormState();
}

class _FlightSearchFormState extends State<FlightSearchForm> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  DateTime? selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = selectedDate!.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: fromController,
              decoration: InputDecoration(
                labelText: 'Departure',
                prefixIcon: Icon(Icons.location_on, color: Colors.lightBlue),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: toController,
              decoration: InputDecoration(
                labelText: 'Destination',
                prefixIcon: Icon(Icons.location_on, color: Colors.lightBlue),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                prefixIcon: Icon(Icons.calendar_today, color: Colors.lightBlue),
              ),
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your search logic here
                String from = fromController.text;
                String to = toController.text;
                String date = dateController.text;
                // Perform the search with the provided data
                print('Searching from $from to $to on $date');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                onPrimary: Colors.white,
              ),
              child: Text('Search'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.directions_bus,
                      size: 40,
                      color: Colors.lightBlue,
                    ),
                    Text('Buses', style: TextStyle(color: Colors.lightBlue)),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.directions_car,
                      size: 40,
                      color: Colors.lightBlue,
                    ),
                    Text('Cars', style: TextStyle(color: Colors.lightBlue)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

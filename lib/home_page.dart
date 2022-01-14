import 'package:date_time_picker/pickers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime? date = DateTime.now();
  late TimeOfDay? time = TimeOfDay.fromDateTime(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () async {
                  date = await Pickers.datePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2023));
                  setState(() {
                    date;
                  });
                },
                child: Text(
                  'DatePicker : ${date!.day}/${date!.month}/${date!.year}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () async {
                  time = await Pickers.timePicker(
                      context: context, initialTime: DateTime.now());
                  setState(() {
                    time;
                  });
                },
                child: Text(
                  'DatePicker : ${time!.hour}:${time!.minute}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
          ],
        )),
      ),
    );
  }
}

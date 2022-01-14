import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pickers {
  Pickers._();

  static Future<DateTime?> datePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    if (Platform.isAndroid) {
      final pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate);
      return pickedDate!;
    } else if (Platform.isIOS) {
      DateTime pickedDate = DateTime.now();
      await showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: firstDate,
                  maximumDate: lastDate,
                  initialDateTime: initialDate,
                  onDateTimeChanged: (datetime) {
                    pickedDate = datetime;
                  }),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Tamam'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
      return pickedDate;
    }
  }

  static Future<TimeOfDay?> timePicker(
      {required BuildContext context, required DateTime initialTime}) async {
    if (Platform.isAndroid) {
      final pickedTime = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialTime));

      return pickedTime!;
    } else if (Platform.isIOS) {
      DateTime pickedDate = DateTime.now();
      await showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: initialTime,
                  onDateTimeChanged: (datetime) {
                    pickedDate = datetime;
                  }),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Tamam'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
      return TimeOfDay.fromDateTime(pickedDate);
    }
  }
}

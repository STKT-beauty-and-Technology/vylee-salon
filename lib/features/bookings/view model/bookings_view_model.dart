import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin BookingsViewModel {
  String getDateString(DateTime date) {
    if (DateTime.now().year == date.year &&
        DateTime.now().month == date.month &&
        DateTime.now().day == date.day) {
      return "Todays Appointment";
    }
    return "${DateFormat.yMd().format(date)} Appointments";
  }

  String getFreeSlotsString(List<TimeOfDay> slot) {
    String slotString = "";
    for (var i = 0; i < 2; i++) {
      final toDate = DateTime(2024, 1, 1, slot[i].hour, slot[i].minute);
      slotString += DateFormat.jm().format(toDate);
      if (i != 1) slotString += "-";
    }
    slotString += " HRS";
    return slotString;
  }
}

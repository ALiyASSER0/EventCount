import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  final Function(DateTime) onDateSelected; // Accepts a callback function

  const DateSelector({super.key, required this.onDateSelected}); // Constructor to take the callback

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });

      // Pass the selected date to the parent widget
      widget.onDateSelected(selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_today),
        const SizedBox(width: 8),
        const Text('تاريخ الانتهاء: '),
        const Spacer(),
        TextButton(
          onPressed: () => _selectDate(context),
          child: Text(selectedDate != null
              ? DateFormat('yyyy-MM-dd').format(selectedDate!)
              : 'اختيار التاريخ'),
        ),
      ],
    );
  }
}

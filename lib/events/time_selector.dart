import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  final Function(TimeOfDay?) onTimeSelected;

  const TimeSelector({super.key, required this.onTimeSelected});

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
      // Call the callback to notify the parent of the new time
      widget.onTimeSelected(selectedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time),
        const SizedBox(width: 8),
        const Text('الوقت النهائي: '),
        const Spacer(),
        TextButton(
          onPressed: () => _selectTime(context),
          child: Text(selectedTime != null
              ? selectedTime!.format(context)
              : 'اختيار الوقت'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget 
{
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> 
{
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async 
  {
    final TimeOfDay? pickedTime = await showTimePicker
    (
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime)
      setState(() {
        selectedTime = pickedTime;
      });
  }

  @override
  Widget build(BuildContext context) 
  {
    return Row
    (
      children: 
      [
        Icon(Icons.access_time),
        SizedBox(width: 8),
        Text('الوقت النهائي: '),
        Spacer(),
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

class UiTimeSelect extends StatelessWidget 
{
  const UiTimeSelect({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const Placeholder();
  }
}

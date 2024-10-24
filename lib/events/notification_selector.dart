
import 'package:flutter/material.dart';

class NotificationSelector extends StatefulWidget 
{
  final String? selectedNotification;

  NotificationSelector({Key? key, this.selectedNotification}) : super(key: key);

  @override
  _NotificationSelectorState createState() => _NotificationSelectorState();
}

class _NotificationSelectorState extends State<NotificationSelector> 
{
  String? selectedNotification;
  final List<String> notifications = 
  [
    "1 day before",
    "1 hour before",
    "10 minutes before"
  ];

  @override
  void initState() {
    super.initState();
    selectedNotification = widget.selectedNotification;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.notifications),
        SizedBox(width: 8),
        Text('الإشعار: '),
        Spacer(),
        DropdownButton<String>(
          value: selectedNotification,
          icon: Icon(Icons.arrow_drop_down),
          items: notifications.map((String value)
          {
            return DropdownMenuItem<String>
            (
              value: value,
              child: Directionality
              (
                textDirection: TextDirection.ltr,
                child: Text(value),
              ),            
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedNotification = newValue;
            });
          },
        ),
      ],
    );
  }
}






















// import 'package:flutter/material.dart';

// class NotificationSelector extends StatefulWidget 
// {
//   NotificationSelector({this.selectedNotification});
//   String? selectedNotification ;

//   @override
//   State<NotificationSelector> createState() => _NotificationSelectorState();
// }

// class _NotificationSelectorState extends State<NotificationSelector> {
//   final List<String> notifications = 
//   [
//     "1 day before",
//     "1 hour before",
//     "10 minutes before"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Row
//           (
//             children: 
//             [
//               Icon(Icons.notifications),
//               SizedBox(width: 8),
//               Text('الإشعار: '),
//               Spacer(),
//               DropdownButton<String>
//               (
//                 value: widget.selectedNotification,
//                 icon: Icon(Icons.arrow_drop_down),
//                 items: notifications.map((String value)
//                 {
//                   return DropdownMenuItem<String>
//                   (
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) 
//                 {
//                     selectedNotification = newValue;
//                 },
//               ),
//             ],
//           );
//   }
// }
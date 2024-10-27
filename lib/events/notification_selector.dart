
import 'package:flutter/material.dart';

class NotificationSelector extends StatefulWidget {
  final String? selectedNotification;
  final ValueChanged<String?> onNotificationChanged;

  const NotificationSelector({
    super.key,
    this.selectedNotification,
    required this.onNotificationChanged,
  });

  @override
  _NotificationSelectorState createState() => _NotificationSelectorState();
}

class _NotificationSelectorState extends State<NotificationSelector> {
  String? selectedNotification;
  final List<String> notifications = [
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
        const Icon(Icons.notifications),
        const SizedBox(width: 8),
        const Text('الإشعار: '),
        const Spacer(),
        DropdownButton<String>(
          value: selectedNotification,
          icon: const Icon(Icons.arrow_drop_down),
          items: notifications.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(value),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedNotification = newValue;
            });
            widget.onNotificationChanged(newValue);
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
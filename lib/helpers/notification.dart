import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';


void scheduleNotification10min(DateTime targetTime) {
  log(targetTime.toString());
  DateTime scheduledTime = targetTime.subtract(const Duration(minutes: 10));
    log(scheduledTime.toString());

  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'basic_channel',
      title: 'Upcoming Event',
      body: 'Your event starts in 10 minutes!',
    ),
    schedule: NotificationCalendar(
      year: scheduledTime.year,
      month: scheduledTime.month,
      day: scheduledTime.day,
      hour: scheduledTime.hour,
      minute: scheduledTime.minute,
      second: 0,
      millisecond: 0,
      repeats: false,
    ),
  );
}

void scheduleNotification1hour(DateTime targetTime) {
  DateTime scheduledTime = targetTime.subtract(const Duration(hours: 1));
  
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 2,
      channelKey: 'basic_channel',
      title: 'Upcoming Event',
      body: 'Your event starts in 1 hour!',
    ),
    schedule: NotificationCalendar(
      year: scheduledTime.year,
      month: scheduledTime.month,
      day: scheduledTime.day,
      hour: scheduledTime.hour,
      minute: scheduledTime.minute,
      second: 0,
      millisecond: 0,
      repeats: false,
    ),
  );
}

void scheduleNotification1day(DateTime targetTime) {
  DateTime scheduledTime = targetTime.subtract(const Duration(days: 1));
  
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 3,
      channelKey: 'basic_channel',
      title: 'Upcoming Event',
      body: 'Your event starts in 1 day!',
    ),
    schedule: NotificationCalendar(
      year: scheduledTime.year,
      month: scheduledTime.month,
      day: scheduledTime.day,
      hour: scheduledTime.hour,
      minute: scheduledTime.minute,
      second: 0,
      millisecond: 0,
      repeats: false,
    ),
  );
}

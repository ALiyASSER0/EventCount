import 'package:event_count_downar/helpers/enums.dart';
import 'package:event_count_downar/helpers/shared.dart';
import 'package:event_count_downar/routing/routes.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const Text(
                  'About EventTick',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B475E),
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                  String card= Shared.getString(key: SharedKeys.colorOfTheme);
                      if (card == "card1") {
                      Navigator.pushNamed(context, Routes.noteViewWithCard1);

                    } else if (card == "card2") {
                      Navigator.pushNamed(context, Routes.noteViewWithCard2);

                    } else if (card == "card3") {
                      Navigator.pushNamed(context, Routes.noteViewWithCard3);

                    }
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Manage your important events and payments with ease. \n'
              'EventTick lets you create \n'
              'countdowns for events,'
              'track your installments, and receive timely reminders.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Key Features',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B475E),
              ),
            ),
            const SizedBox(height: 8),
            const ListTile(
              leading: Icon(Icons.event, color: Color(0xFF2B475E)),
              title: Text('Countdown to your special moments.'),
            ),
            const ListTile(
              leading: Icon(Icons.payment, color: Color(0xFF2B475E)),
              title: Text('Keep track of payments with reminders.'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications, color: Color(0xFF2B475E)),
              title: Text(
                  'Get timely notifications for all your events and payments.'),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Made with Love ❤️',
                style: TextStyle(fontSize: 16, fontFamily: 'Pacifico'),
              ),
            ),
            const Spacer(),
            const Row(
              children: [
                Image(
                  image: AssetImage("assets/images/black-logo.png"),
                  height: 40,
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      'Version 1.0.0',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '© 2024 EventTick',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

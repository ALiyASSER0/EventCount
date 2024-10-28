import 'package:event_count_downar/helpers/enums.dart';
import 'package:event_count_downar/helpers/shared.dart';
import 'package:event_count_downar/routing/routes.dart';
import 'package:flutter/material.dart';

class ThemeMyApp extends StatefulWidget {
  const ThemeMyApp({super.key});

  @override
  _ThemeMyAppState createState() => _ThemeMyAppState();
}

class _ThemeMyAppState extends State<ThemeMyApp> {
  String selectedCard = Shared.getString(key: SharedKeys.colorOfTheme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'المظهر',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    if (selectedCard == "card1") {
                      Navigator.pushNamed(context, Routes.noteViewWithCard1);
                    Shared.putString(key: SharedKeys.colorOfTheme, value: 'card1');

                    } else if (selectedCard == "card2") {
                      Navigator.pushNamed(context, Routes.noteViewWithCard2);
                    Shared.putString(key: SharedKeys.colorOfTheme, value: 'card2');

                    } else if (selectedCard == "card3") {
                      Navigator.pushNamed(context, Routes.noteViewWithCard3);
                    Shared.putString(key: SharedKeys.colorOfTheme, value: 'card3');

                    }
                  },
                  child: const Text(
                    "حفظ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 20, 133, 225),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'مظهر الاحداث',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCard = 'card1';
                });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/imag.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCard = 'card1';
                        });
                      },
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          if (selectedCard == 'card1') ...[
                            const Icon(
                              Icons.verified,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'الافتراضي',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCard = 'card2';
                });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/card2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCard = 'card2';
                        });
                      },
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          if (selectedCard == 'card2') ...[
                            const Icon(
                              Icons.verified,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'الافتراضي',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCard = 'card3';
                });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/card3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCard = 'card3';
                        });
                      },
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          if (selectedCard == 'card3') ...[
                            const Icon(
                              Icons.verified,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'الافتراضي',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

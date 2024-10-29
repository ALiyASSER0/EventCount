import 'dart:io';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';
import 'my_drawer_list.dart';
import 'widgets/custem_widget/custom_button.dart';

class Feedbackscreen extends StatefulWidget {
  const Feedbackscreen({super.key});

  @override
  FeedbackscreenState createState() => FeedbackscreenState();
}

class FeedbackscreenState extends State<Feedbackscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        width: 290,
        child: MyDrawerList(),
      ),
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: double.infinity,
                  height: constraints.maxHeight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.05,
                      right: constraints.maxWidth * 0.05,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Mobile feed-rafiki.png',
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'اهلا بيك في صفحة الدعم',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text( textAlign: TextAlign.center,
                            'هنا يمكنك ارسال جميع الشكاوي والمقترحات \n شكرا جدا لك هذه المقترحات ستفيدنا كثيرا',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'تعليمات:\n1. اضغط علي الزر ارسل مقترح.\n2. قم بملئ البيانات المطلوبة.\n3. ارسل المقترح الينا في الايميل.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          CustomButton(
                            onPressed: () {
                              BetterFeedback.of(context).show(
                                (UserFeedback feedback) async {
                                  final directory =
                                      await getApplicationDocumentsDirectory();
                                  final imagePath =
                                      '${directory.path}/feedback.png';
                                  final imageFile = File(imagePath);
                                  await imageFile
                                      .writeAsBytes(feedback.screenshot);
                      
                                  final Email email = Email(
                                    body: feedback.text,
                                    subject: 'Feedback from Flutter app',
                                    recipients: ['lbsbahmed@gmail.com'],
                                    attachmentPaths: [imageFile.path],
                                  );
                      
                                  await FlutterEmailSender.send(email);
                                },
                              );
                            },
                            text: 'ارسل مقترح',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

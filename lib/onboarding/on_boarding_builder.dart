
import 'package:event_count_downar/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingBuilder extends StatelessWidget {
  final OnboardingModel model;
  const OnBoardingBuilder({super.key, required this.model});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
              children: [
                Text(

                  textAlign: TextAlign.center,
                  model.label,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,

                  ),
                  ),
               Image.asset(model.image),
                SizedBox(height: 3.h,),
                Text(

                  textAlign: TextAlign.center,
                  model.description,
                  style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.grey[600],

                  ),
                  ),
              ]
            ),
    );
  }
}
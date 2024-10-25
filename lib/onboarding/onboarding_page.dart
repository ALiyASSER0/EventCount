import 'package:event_count_downar/constants/colors.dart';
import 'package:event_count_downar/helpers/enums.dart';
import 'package:event_count_downar/helpers/shared.dart';
import 'package:event_count_downar/onboarding/on_boarding_builder.dart';
import 'package:event_count_downar/onboarding/onboarding_model.dart';
import 'package:event_count_downar/routing/routes.dart';
import 'package:event_count_downar/views/home_view.dart';
import 'package:event_count_downar/views/notes_view.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  saveOnBoarding(bool done) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.homeView,
      (route) => false,
    );
  }

  var pageController = PageController();
  bool islast = false;
  bool isfirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (isfirst)
            TextButton(
              child: Text(
                isfirst ? 'Skip' : '',
                style: TextStyle(
                  color: Colors.purple[900],
                  fontSize: 18.sp,
                ),
              ),
              onPressed: () {
                setState(() {
                  islast = true;
                  Shared.putBOOl(
                      key: SharedKeys.islastOnBoarding, value: islast);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const NotesView()),
                      (route) => false);
                  isfirst = true;
                });
              },
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: data.length,
                onPageChanged: (index) {
                  if (index == data.length - 1) {
                    setState(() {
                      islast = true;
                      isfirst = index == 0 ? true : false;
                    });
                  } else {
                    setState(() {
                      islast = false;
                      isfirst = index == 0 ? true : false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: OnBoardingBuilder(model: data[index]),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: data.length,
              effect: ExpandingDotsEffect(
                dotHeight: 11.sp,
                dotWidth: 11.sp,
                activeDotColor: AppColors.mainBlue,
                dotColor: Colors.grey.withOpacity(0.5),
                expansionFactor: 5,
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomButton(
              onPressed: () {
                islast
                    ? setState(() {
                        islast = true;
                        Shared.putBOOl(
                            key: SharedKeys.islastOnBoarding, value: islast);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomeView()),
                            (route) => false);
                        isfirst = true;
                      })
                    : pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
              },
              text: islast ? 'Get Started' : 'Next',
            ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}

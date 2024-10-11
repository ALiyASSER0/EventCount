class OnboardingModel {
  String description;
  String image;
  String label;

  OnboardingModel(
      {required this.description, required this.image, required this.label});
}

List<OnboardingModel> data = [
  OnboardingModel(
    label: "Countdown to Life's Biggest Moments!",
    description:
        'Track birthdays, meetings, and more. Keep your special events at your fingertips',
    image: "assets/images/onboarding1.png",
  ),
  OnboardingModel(
    label: 'Never Miss a Payment',
    description:
        'Stay organized by tracking installment payments and receiving timely reminders',
    image: "assets/images/onboarding2.png",
  ),
  OnboardingModel(
    label: 'Get Notified, Stay Ahead!',
    description:
       "Receive custom reminders for events and payments, so you're always prepared",
    image: "assets/images/onboarding3.png",
  ),
];

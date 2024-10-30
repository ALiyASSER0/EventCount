class OnboardingModel {
  String description;
  String image;
  String label;

  OnboardingModel(
      {required this.description, required this.image, required this.label});
}

List<OnboardingModel> data = [
  OnboardingModel(
    label: "العد التنازلي لأعظم لحظات الحياة",
    description:
        'تتبع أعياد الميلاد والاجتماعات والمزيد. اجعل مناسباتك الخاصة في متناول يديك',
    image: "assets/images/onboarding1.png",
  ),
  OnboardingModel(
    label: 'تابع مهامك بسهولة وتجنب أي نسيان',
    description:
        'ابقَ منظماً من خلال تتبع التزاماتك وتلقي الإشعارات في الوقت المناسب',
    image: "assets/images/onboarding2.png",
  ),
  OnboardingModel(
    label: 'لا تدع أي مهمة أو موعد يفوتك بعد الآن',
    description:
       "احصل على تذكيرات مخصصة للفعاليات والمواعيد لتكون دائماً على استعداد",
    image: "assets/images/onboarding3.png",
  ),
];

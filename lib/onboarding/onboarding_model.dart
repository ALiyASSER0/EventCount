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
    label: 'لا تفوت أي قسط',
    description:
        'كن منظما من خلال تتبع مدفوعات الأقساط وتلقي الاشعارات في الوقت المناسب',
    image: "assets/images/onboarding2.png",
  ),
  OnboardingModel(
    label: 'تلقى الإشعارات وابقَ مستعدا',
    description:
       "احصل على تذكيرات مخصصة للفعاليات والمدفوعات لتكون دائماً على استعداد",
    image: "assets/images/onboarding3.png",
  ),
];

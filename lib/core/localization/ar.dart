import 'package:boilerplate/core/localization/localization_keys.dart';

const Map<String, String> ar = {
  ///login
  LocalizationKeys.login: "تسجل الدخول",
  LocalizationKeys.password: "كلمة السر",
  LocalizationKeys.userName: "أسم المستخدم",
  LocalizationKeys.doNotHaveAccount: "ليس لديك حساب ؟\n",
  LocalizationKeys.signUp: "انشاء حساب",
  LocalizationKeys.emailIsRequired: "البريد الإلكتروني مطلوب",
  LocalizationKeys.passwordIsRequired: "كلمة السر مطلوبة",
  LocalizationKeys.passwordMustContain:
      "كلمة السر يجب أن تحتوي على حرف واحد على الأقل وأرقام وحروف خاصة",
  LocalizationKeys.enterValidEmailFormat: "البريد الإلكتروني غير صحيح",
  LocalizationKeys.enterValidFormat: "أدخل صيغة صحيحة",
  LocalizationKeys.atLeast3Characters: "يجب أن تكون من 3 أحرف على الأقل",
  LocalizationKeys.atLeast6Characters: "يجب أن تكون من 6 أحرف على الأقل",
  LocalizationKeys.atLeast8Characters:
      "يجب أن تكون كلمة السر من 8 أحرف على الأقل",
  LocalizationKeys.atLeast10Characters: "يجب أن تكون من 10 أحرف على الأقل",

  ///academic info
  LocalizationKeys.academicInformation: 'معلومات الأكاديمية',
  LocalizationKeys.currentCertificate: 'الشهادات الحالية',
  LocalizationKeys.program: 'برنامج',
  LocalizationKeys.next: 'التالي',
  LocalizationKeys.select: 'أختر',

  ///personal info
  LocalizationKeys.personalInformation: 'المعلومات الشخضية',
  LocalizationKeys.email: 'البريد الالكتروني',
  LocalizationKeys.yourFirstNameEnglish: 'الأسم الأول (بالانجليزية)',
  LocalizationKeys.yourSecondNameEnglish: 'الأسم الثاني (بالانجليزية)',
  LocalizationKeys.yourLastNameEnglish: 'الأسم الأخير (بالانجليزية)',
  LocalizationKeys.yourFirstNameArabic: 'الأسم الأول (بالعربية)',
  LocalizationKeys.yourSecondNameArabic: 'الأسم الثاني (بالعربية)',
  LocalizationKeys.yourLastNameArabic: 'الأسم الأخير (بالعربية)',
  LocalizationKeys.nationalIdPassportNumber: 'رقم البطاقة/رقم جواز السفر',
  LocalizationKeys.dateOfBirth: 'تاريخ الميلاد',
  LocalizationKeys.mobileNumber: 'رقم الهاتف',
  LocalizationKeys.gender: 'النوع',
  LocalizationKeys.male: 'ذكر',
  LocalizationKeys.female: 'أنثي',
  LocalizationKeys.country: 'البلد',
  LocalizationKeys.nationality: 'الجنسية',
  LocalizationKeys.yourJob: 'وظيفتك',
  LocalizationKeys.yourCompany: 'شركتك',
  LocalizationKeys.currentAddress: 'العنوان الحالي',

  ///files upload
  LocalizationKeys.filesUpload: 'تحميل الملفات',
  LocalizationKeys.copyOfYourIdOrPassport: 'نسخة من جواز سفرك',
  LocalizationKeys.copyOfTheAcademicCertificate: 'نسخة من الشهادة الأكاديمية',
  LocalizationKeys.copyOfTranscript: ' A copy of transcript',
  LocalizationKeys.copyOfTheStudentsContractWithTheUniversity:
      'نسخة من عقد الطالب مع الجامعة',
  LocalizationKeys.bachelorMasterContractDownloadLink:
      '(رابط تنزيل عقد البكالوريوس / الماجستير)',
  LocalizationKeys.phdContractDownloadLink: '(رابط تنزيل عقد الدكتوراه)',
  LocalizationKeys.theContractMustBeSignedHandwrittenAndOnAllPages:
      'يجب توقيع العقد بخط اليد وعلى جميع الصفحات!',
  LocalizationKeys.uploadCv: 'تحميل السيرة الذاتية',
  LocalizationKeys.selectFile: 'أختر الملف',

  ///submit registration
  LocalizationKeys.submitRegistration: 'تأكيد التسجيل',
  LocalizationKeys.weRecommendToUseEmail:
      'نوصي بعدم استخدام البريد الإلكتروني من شركة (hotmail.com) ، لأن لديهم مشكلة مع بعض رسائل البريد الإلكتروني التي لا يتم إرسالها إليهم.',
  LocalizationKeys.iReadAndAgree: 'قرأت وأوافق على',
  LocalizationKeys.termsAndCondition: 'شروط وأحكام القبول',
  LocalizationKeys.mustToApproveOnTermsAndCondition:
      'يجب الموافقة علي الشروط و الأحكام',
  LocalizationKeys.success: 'تم بنجاح',
  LocalizationKeys.submit: 'تسجيل',

  //-------------------------------------------------------------------------
  ///Home
  LocalizationKeys.home: 'الرئيسية',
  LocalizationKeys.balance: 'الرصيد',
  LocalizationKeys.totalAmount: 'المبلغ الإجمالي',
  LocalizationKeys.totalAmountPaid: 'المبلغ الإجمالي المدفوع',
  LocalizationKeys.totalAmountUnpaid: 'المبلغ الإجمالي الغير مدفوع',
  LocalizationKeys.programAmount: 'المبلغ الإجمالي للبرنامج',
  LocalizationKeys.paidAmount: 'المبلغ المدفوع',
  LocalizationKeys.unPaidAmount: 'المبلغ الغير مدفوع',
  LocalizationKeys.aed: 'درهم',

  //-------------------------------------------------------------------------
  ///Profile
  LocalizationKeys.profile: 'الملف الشخصي',
  LocalizationKeys.passwordConfirmation: 'تأكيد كلمة المرور',
  LocalizationKeys.fullNameEnglish: 'الأسم الكامل (بالانجليزية)',
  LocalizationKeys.fullNameArabic: 'الأسم الكامل (بالعربية)',
  LocalizationKeys.updateProfile: 'تحديث الملف الشخصي',
  LocalizationKeys.selectPhoto: 'أختر الصورة',

  //-------------------------------------------------------------------------
  ///Notification
  LocalizationKeys.notification: 'الإشعارات',
  LocalizationKeys.noNotificationFound: 'لا يوجد إشعارات',
  LocalizationKeys.all: 'الكل',
  LocalizationKeys.unread: 'غير مقروء',
  LocalizationKeys.read: 'مقروء',
  LocalizationKeys.neww: 'جديد',
  LocalizationKeys.filterByType: 'تصفية حسب النوع',

  //-------------------------------------------------------------------------
  ///Finance
  LocalizationKeys.finance: 'المالية',
  LocalizationKeys.status: 'الحالة',
  LocalizationKeys.paid: 'مدفوع',
  LocalizationKeys.total: 'المبلغ الإجمالي',
  LocalizationKeys.paidAt: ' تم الدفع في',

  //-------------------------------------------------------------------------
  ///Letters
  LocalizationKeys.letters: 'الخطابات',
  //-------------------------------------------------------------------------
  ///Transcript
  LocalizationKeys.transcript: 'السجل التراكيبي',

  //-------------------------------------------------------------------------
  ///Settings
  LocalizationKeys.settings: 'الإعدادات',

  //-------------------------------------------------------------------------
  ///global
  LocalizationKeys.logout: 'تسجيل الخروج',
  LocalizationKeys.thisFieldIsRequired: 'هذا الحقل مطلوب',
  LocalizationKeys.cancel: 'إلغاء',
  LocalizationKeys.doYouWantToLogout: 'هل تريد تسجيل الخروج؟',
};

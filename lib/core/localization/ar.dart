import 'package:esu/core/localization/localization_keys.dart';

const Map<String, String> ar = {
  ///splash
  LocalizationKeys.thereInAnUpdateAvailable: 'هناك تحديث جديد',
  LocalizationKeys.youShouldUpdateTheAppToContinueUsingIt: 'يجب تحديث التطبيق للمتابعة',
  LocalizationKeys.update: 'تحديث',

  //---------------------------------------------------------------------------------------------
  ///login
  LocalizationKeys.login: "تسجل الدخول",
  LocalizationKeys.password: "كلمة السر",
  LocalizationKeys.changePassword: "تغير كلمة السر",
  LocalizationKeys.userName: "أسم المستخدم",
  LocalizationKeys.studentId: "رقم الطالب",
  LocalizationKeys.doNotHaveAccount: "التحق بالجامعة \n",
  LocalizationKeys.admission: "تسجيل",
  LocalizationKeys.signUp: "انشاء حساب",
  LocalizationKeys.emailIsRequired: "البريد الإلكتروني مطلوب",
  LocalizationKeys.passwordIsRequired: "كلمة السر مطلوبة",
  LocalizationKeys.passwordMustContain: "كلمة السر يجب أن تحتوي على حرف واحد على الأقل وأرقام وحروف خاصة",
  LocalizationKeys.enterValidEmailFormat: "البريد الإلكتروني غير صحيح",
  LocalizationKeys.enterValidFormat: "أدخل صيغة صحيحة",
  LocalizationKeys.atLeast3Characters: "يجب أن تكون من 3 أحرف على الأقل",
  LocalizationKeys.atLeast6Characters: "يجب أن تكون من 6 أحرف على الأقل",
  LocalizationKeys.onlyAcceptSixNumbers: 'يقبل فقط ٦ ارقام',
  LocalizationKeys.atLeast8Characters: "يجب أن تكون كلمة السر من 8 أحرف على الأقل",
  LocalizationKeys.atLeast10Characters: "يجب أن تكون من 10 أحرف على الأقل",
  LocalizationKeys.forgetPassword: "هل نسيت كلمة المرور؟",
  LocalizationKeys.enterEmail: "أدخل البريد الإلكتروني",
  LocalizationKeys.resetPassword: "إعادة تعيين كلمة المرور",
  LocalizationKeys.enterCode: "أدخل الكود",
  LocalizationKeys.verificationCode: "كود التحقق",
  LocalizationKeys.passwordConfirmationNotMatchedWithPassword: "كلمة المرور غير متطابقة",
  LocalizationKeys.congratulationYouHaveSuccessfullyChangedYourPassword: "تهانينا! تم تغيير كلمة المرور بنجاح",
  LocalizationKeys.goToLogin: "الذهاب إلى تسجيل الدخول",
  LocalizationKeys.verificationCodeSentToEmail: "تم إرسال كود التحقيق إلى البريد الإلكتروني",

  ///academic info
  LocalizationKeys.academicInformation: 'معلومات الأكاديمية',
  LocalizationKeys.currentCertificate: 'الشهادات الحالية',
  LocalizationKeys.program: 'برنامج',
  LocalizationKeys.next: 'التالي',
  LocalizationKeys.select: 'أختر',
  LocalizationKeys.secondarySchool: 'الثانوية',
  LocalizationKeys.bachelor: 'بكالريوس',
  LocalizationKeys.master: 'ماجستير',
  LocalizationKeys.phd: 'دكتوراة',
  LocalizationKeys.pleaseToCompleteRegistrationBeSureToDownloadContractAndHaveYourSignature:
      'من فضلك لاكمال التقديم الرجاء التأكد من تحميل العقود و الامضاء عليها علي جميع الصفحات',

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
  LocalizationKeys.identificationNumber: 'رقم الهوية',
  LocalizationKeys.dateOfBirth: 'تاريخ الميلاد',
  LocalizationKeys.mobileNumber: 'رقم الجوال',
  LocalizationKeys.gender: 'الجنس',
  LocalizationKeys.male: 'ذكر',
  LocalizationKeys.female: 'أنثي',
  LocalizationKeys.country: 'البلد',
  LocalizationKeys.nationality: 'الجنسية',
  LocalizationKeys.yourJob: 'وظيفتك',
  LocalizationKeys.yourCompany: 'شركتك',
  LocalizationKeys.currentAddress: 'العنوان الحالي',
  LocalizationKeys.search: 'ابحث',
  LocalizationKeys.searchToFindCountry: 'البحث للعثور على البلد',
  LocalizationKeys.noCountryMatched: 'لا يوجد بلد مطابق',
  LocalizationKeys.mapScreen: 'خريطة',
  LocalizationKeys.selectLocation: 'أختر الموقع',
  LocalizationKeys.locationPermissionNotAllowed: 'الموقع غير مسموح به',
  LocalizationKeys.errorInLocation: 'خطأ في الموقع',
  LocalizationKeys.facebook: 'فيسبوك',
  LocalizationKeys.whatsApp: 'واتس اب',
  LocalizationKeys.instagram: 'انستجرام',
  LocalizationKeys.twitter: 'تويتر',
  LocalizationKeys.linkedin: 'لينكدان',
  LocalizationKeys.optional: 'اختياري',
  LocalizationKeys.whatsAppPin: 'كود الواتس اب',
  LocalizationKeys.iWantToPublishPersonalInfo: 'ارغب باشهار معلوماتي الشخصية (الاسم ، الوظيفة ، الصورة).',
  LocalizationKeys.publishPersonalInfoMessage:
      'تسعي الجامعة بالتعريف عن الطلاب في منصات التواصل الاجتماعي و ذلك للمساهمه في نشر بيانات الطلبه و الحصول علي فرص عملية افضل في سوق العمل.',

  ///files upload
  LocalizationKeys.filesUpload: 'تحميل الملفات',
  LocalizationKeys.copyOfYourIdOrPassport: 'صورة الهوية او جواز السفر',
  LocalizationKeys.copyOfTheAcademicCertificate: 'صورة اخر شهادة اكاديمية حصلت عليها',
  LocalizationKeys.copyOfTranscript: 'سجل درجات اخر درجة اكاديمية حصلت عليها',
  LocalizationKeys.copyOfTheStudentsContractWithTheUniversity: 'عقد الطالب مع الجامعة',
  LocalizationKeys.bachelorMasterContractDownloadLink: '(رابط تنزيل عقد البكالوريوس / الماجستير)',
  LocalizationKeys.phdContractDownloadLink: '(رابط تنزيل عقد الدكتوراه)',
  LocalizationKeys.theContractMustBeSignedHandwrittenAndOnAllPages: 'يجب توقيع العقد بخط اليد وعلى جميع الصفحات!',
  LocalizationKeys.uploadCv: 'السيرة الذاتية الخاصة بك في صيغة PDF',
  LocalizationKeys.selectFile: 'أختر الملف',
  LocalizationKeys.maxFileSizeIsTenMegabytes: 'الحجم الأقصى للملف هو 10 ميغابايت',
  LocalizationKeys.sorryThisFileTypeIsNotAllowed: 'عذرا، هذا النوع من الملفات غير مسموح',

  ///submit registration
  LocalizationKeys.submitRegistration: 'تأكيد التسجيل',
  LocalizationKeys.weRecommendToUseEmail: 'نوصي بعدم استخدام البريد الإلكتروني من شركة (hotmail.com) ، لأن لديهم مشكلة مع بعض رسائل البريد الإلكتروني التي لا يتم إرسالها إليهم.',
  LocalizationKeys.youShouldToReadTermsAndCondition: 'يجب ان تقرأ شروط و أحكام الجامعة و توافق عليها حتي تتمكن من التسجيل',
  LocalizationKeys.iReadAndAgree: 'أوافق على',
  LocalizationKeys.termsAndCondition: 'شروط وأحكام القبول',
  LocalizationKeys.mustToApproveOnTermsAndCondition: 'يجب الموافقة علي الشروط و الأحكام',
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
  LocalizationKeys.goToProfile: 'الذهاب إلى الملف الشخصي',
  LocalizationKeys.goToInvoice: 'الذهاب إلى الفاتورة',
  LocalizationKeys.youMustCompleteProfileFilesToCompleteAnyProcess: 'يجب تحميل الملفات الشخصية لتكملة أي عملية',
  LocalizationKeys.youMustPayInvoiceToCompleteAnyProcess: 'يجب دفع الفاتورة لتكملة أي عملية',
  LocalizationKeys.knowledgeAmbassadorCredit: 'محفظة سفير المعرفة',
  LocalizationKeys.gpa: 'المعدل التراكمي',

  //-------------------------------------------------------------------------
  ///Profile
  LocalizationKeys.profile: 'الملف الشخصي',
  LocalizationKeys.passwordConfirmation: 'تأكيد كلمة المرور',
  LocalizationKeys.fullNameEnglish: 'الأسم الكامل (بالانجليزية)',
  LocalizationKeys.fullNameArabic: 'الأسم الكامل (بالعربية)',
  LocalizationKeys.updateProfile: 'تحديث الملف الشخصي',
  LocalizationKeys.selectPhoto: 'أختر الصورة',
  LocalizationKeys.selectPhotoSource: 'أختر مصدر الصورة',
  LocalizationKeys.camera: 'الكاميرا',
  LocalizationKeys.gallery: 'المعرض',

  //-------------------------------------------------------------------------
  ///Notification
  LocalizationKeys.notification: 'الإشعارات',
  LocalizationKeys.noNotificationFound: 'لا يوجد إشعارات',
  LocalizationKeys.all: 'الكل',
  LocalizationKeys.unread: 'غير مقروء',
  LocalizationKeys.read: 'مقروء',
  LocalizationKeys.neww: 'جديد',
  LocalizationKeys.filterByType: 'تصفية حسب النوع',
  LocalizationKeys.markAllAsRead: 'تحديد الكل كمقروء',
  LocalizationKeys.failedMarkAllAsRead: 'فشلت عملية تحديد الكل كمقروء',
  LocalizationKeys.successMarkAllAsRead: 'تم تحديد الكل كمقروء',

  //-------------------------------------------------------------------------
  ///Finance
  LocalizationKeys.finance: 'المالية',
  LocalizationKeys.status: 'الحالة',
  LocalizationKeys.paid: 'مدفوع',
  LocalizationKeys.total: 'المبلغ الإجمالي',
  LocalizationKeys.paidAt: ' تم الدفع في',
  LocalizationKeys.waiting: 'الرجاء الانتظار',
  LocalizationKeys.pay: 'دفع',
  LocalizationKeys.payment: 'الدفع',
  LocalizationKeys.noDataFound: 'لا يوجد بيانات',
  LocalizationKeys.dueDate: 'تاريخ الاستحقاق',
  LocalizationKeys.remaining: 'المتبقي',
  LocalizationKeys.notPutTillNow: 'لم يتم تحديد حتى الآن',
  LocalizationKeys.waitingForPayment: 'الرجاء الانتظار حتى لفتح بوابة الدفع',

  //-------------------------------------------------------------------------
  ///Letters
  LocalizationKeys.letters: 'الخطابات',
  LocalizationKeys.englishVersion: 'النسخة الانجليزية',
  LocalizationKeys.arabicVersion: 'النسخة العربية',
  LocalizationKeys.noLettersFound: 'لا يوجد خطابات',
  LocalizationKeys.letterPdfViewer: 'مستعرض الخطابات',

  //-------------------------------------------------------------------------
  ///Transcript
  LocalizationKeys.transcript: 'السجل الأكاديمي',
  LocalizationKeys.showPdf: 'عرض السجل الأكاديمي',

  //-------------------------------------------------------------------------
  ///Settings
  LocalizationKeys.settings: 'الإعدادات',
  LocalizationKeys.language: 'اللغة',
  LocalizationKeys.dangerZone: 'المنطقة الخطرة',
  LocalizationKeys.deleteUserAccount: 'حذف الحساب',
  LocalizationKeys.delete: 'حذف',
  LocalizationKeys.ifYouDeleteYourAccountYouWillNotBeAbleToLoginAgain: 'إذا قمت بحذف حسابك لن تتمكن من تسجيل الدخول مرة أخرى',

  //-------------------------------------------------------------------------
  ///study plans
  LocalizationKeys.studyPlans: 'خطط الدراسة',
  LocalizationKeys.noStudyPlansFound: 'لا يوجد خطط الدراسة',
  LocalizationKeys.hours: 'ساعات',
  LocalizationKeys.code: 'الكود',
  LocalizationKeys.prerequisites: 'المقدمات',

  //-------------------------------------------------------------------------
  ///student card
  LocalizationKeys.studentCard: 'بطاقة الطالب',
  LocalizationKeys.studentName: 'أسم الطالب',
  //-------------------------------------------------------------------------
  ///FAQ
  LocalizationKeys.faq: 'الأسئلة الشائعة',

  //-------------------------------------------------------------------------
  ///access to moodle
  LocalizationKeys.accessToMoodle: 'الوصول إلى مودل',
  LocalizationKeys.goToMoodle: 'الذهاب إلى مودل',
  LocalizationKeys.moodleUrl: 'رابط مودل',
  LocalizationKeys.playVideo: 'تشغيل الفيديو',

  //-------------------------------------------------------------------------
  ///lecture table
  LocalizationKeys.lectureTable: 'المحاضرات',
  LocalizationKeys.noLectureFound: 'لا يوجد محاضرات',
  LocalizationKeys.lecture: 'المحاضرة',
  LocalizationKeys.teacherName: 'أسم المدرس',
  LocalizationKeys.weeklyLecture: 'المحاضرة الأسبوعية',
  LocalizationKeys.note: 'ملاحظة',
  LocalizationKeys.courseCode: 'كود المادة',

  //-------------------------------------------------------------------------
  ///schedule
  LocalizationKeys.schedule: 'جدول المحاضرات',

  //-------------------------------------------------------------------------
  ///term registration
  LocalizationKeys.termRegistration: 'تسجيل الفصل الدراسي',
  LocalizationKeys.registerForTheTerm: 'تسجيل الفصل الدراسي',
  LocalizationKeys.scholarshipPercentage: 'نسبة المنحة الدراسية',
  LocalizationKeys.trimester: 'الفصل الدراسي',
  LocalizationKeys.cost: 'التكلفة',

  //-------------------------------------------------------------------------
  ///tickets
  LocalizationKeys.tickets: 'التذاكر',
  LocalizationKeys.ticket: 'التذكرة',
  LocalizationKeys.noTicketsFound: 'لا يوجد تذاكر',
  LocalizationKeys.ticketNumber: 'رقم التذكرة',
  LocalizationKeys.ticketDate: 'تاريخ التذكرة',
  LocalizationKeys.ticketStatus: 'حالة التذكرة',
  LocalizationKeys.ticketType: 'نوع التذكرة',
  LocalizationKeys.ticketDescription: 'وصف التذكرة',
  LocalizationKeys.ticketSolution: 'حل التذكرة',
  LocalizationKeys.ticketSolutionDate: 'تاريخ حل التذكرة',
  LocalizationKeys.ticketIsClosed: 'تم إغلاق التذكرة',
  LocalizationKeys.ticketDetails: 'تفاصيل التذكرة',
  LocalizationKeys.ticketSupport: 'تذاكر الدعم',
  LocalizationKeys.ticketCreated: 'تم إنشاء التذكرة',
  LocalizationKeys.ticketCreate: 'إنشاء تذكرة',
  LocalizationKeys.addTicket: 'إضافة تذكرة',
  LocalizationKeys.replyAddedSuccessfully: 'تمت إضافة الرد بنجاح',
  LocalizationKeys.body: 'المحتوى',
  LocalizationKeys.pleaseEnterValidSubject: 'الرجاء إدخال عنوان صحيح',
  LocalizationKeys.pleaseEnterValidBody: 'الرجاء إدخال محتوى صحيح',
  LocalizationKeys.pleaseSelectCategory: 'الرجاء إختيار فئة',
  LocalizationKeys.sorryCannotAddReplyBecauseTicketIsClosed: 'عذراً، لا يمكن إضافة رد للتذكرة لأنها مغلقة',
  LocalizationKeys.createdBy: 'أنشأت بواسطة',
  LocalizationKeys.categories: 'الفئات',
  LocalizationKeys.subject: 'الموضوع',
  LocalizationKeys.description: 'الوصف',
  LocalizationKeys.category: 'الفئة',
  LocalizationKeys.noRepliesFound: 'لا يوجد ردود',
  LocalizationKeys.reply: 'الرد',
  LocalizationKeys.message: 'الرسالة',
  LocalizationKeys.writeReplyHere: 'أكتب الرد هنا',
  LocalizationKeys.sendReply: 'إرسال الرد',
  LocalizationKeys.send: 'إرسال',
  LocalizationKeys.sendFile: 'إرسال الملف',
  LocalizationKeys.addTitleWithFile: 'أضف عنوانا للملف',
  LocalizationKeys.pickedFile: 'الملف المختار',
  LocalizationKeys.pleaseAddReply: 'يرجى إضافة ردا',
  LocalizationKeys.downloadFile: 'تحميل الملف',
  LocalizationKeys.openFile: 'فتح الملف',
  LocalizationKeys.student: 'الطالب',
  LocalizationKeys.shouldToGivePermissionToAccessFiles: 'يجب تعيين سماحية الوصول إلى الملفات',
  LocalizationKeys.successfullyDownloadedFileOnYourDevice: 'تم تحميل الملف بنجاح على جهازك',
  //-------------------------------------------------------------------------
  ///course register
  LocalizationKeys.editCourses: 'تسجيل المواد',
  LocalizationKeys.registerForTheCourse: 'تسجيل المادة',
  LocalizationKeys.course: 'المادة',
  LocalizationKeys.courseHours: 'ساعات المادة',
  LocalizationKeys.addCourse: 'إضافة مادة',
  LocalizationKeys.removeCourse: 'إزالة مادة',
  LocalizationKeys.courseName: 'أسم المادة',
  LocalizationKeys.noCoursesRegistered: 'لا يوجد مواد مسجلة',
  LocalizationKeys.noCoursesAvailable: 'لا يوجد مواد متاحة',

  //-------------------------------------------------------------------------
  ///attendance
  LocalizationKeys.attendance: 'الحضور',
  LocalizationKeys.noAttendanceFound: 'لا يوجد حضور',
  LocalizationKeys.attendanceDate: 'تاريخ الحضور',
  LocalizationKeys.attendanceStatus: 'حالة الحضور',
  LocalizationKeys.openTime: 'وقت الحضور',
  LocalizationKeys.closeTime: 'وقت الإنتهاء',
  LocalizationKeys.absence: 'غياب',
  LocalizationKeys.isFinished: 'هل تم الانتهاء من الحضور',
  LocalizationKeys.details: 'تفاصيل',
  LocalizationKeys.finished: 'منتهي',
  LocalizationKeys.quizzes: 'الأختبارات',

//-------------------------------------------------------------------------
  ///global
  LocalizationKeys.logout: 'تسجيل الخروج',
  LocalizationKeys.thisFieldIsRequired: 'هذا الحقل مطلوب',
  LocalizationKeys.cancel: 'إلغاء',
  LocalizationKeys.doYouWantToLogout: 'هل تريد تسجيل الخروج؟',
  LocalizationKeys.completeAllTheFields: 'يرجى تعبئة جميع الحقول',
  LocalizationKeys.somethingWentWrong: 'حدث خطأ ما',
  LocalizationKeys.somethingWentWrongTryAgain: 'حدث خطأ ما، حاول مرة اخرى',
  LocalizationKeys.hello: 'مرحبا',
  LocalizationKeys.done: 'تم',
  LocalizationKeys.error: 'خطأ',
  LocalizationKeys.failed: 'فشل',
  LocalizationKeys.congratulations: 'تهانينا',
  LocalizationKeys.successfullyDone: 'تم بنجاح',
  LocalizationKeys.createdAt: 'أنشأت في',
  LocalizationKeys.updatedAt: 'حُدثت في',
  LocalizationKeys.deletedAt: 'حُذفت في',
  LocalizationKeys.closedAt: 'أغلقت في',
  LocalizationKeys.darkMode: 'الوضع الداكن',
  LocalizationKeys.close: 'إغلاق',
  LocalizationKeys.ok: 'حسنا',
};

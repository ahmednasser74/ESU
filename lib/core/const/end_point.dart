class Endpoints {
  // static const String baseUrl = 'https://sis.esu.ac.ae/api/';
  static const String baseUrl = 'https://sisdev.esu.ac.ae/api/';

  //-----------------------------------------------------------------------
  ///Auth
  static const String admission = 'admission';
  static const String login = 'login';
  static const String forgetPassword = 'forgot-password';
  static const String resetPassword = 'reset-password';

  //-----------------------------------------------------------------------
  ///lookup
  static const String lookup = 'lookup/get';
  static const String transcript = 'transcript';
  static const String planOfStudy = 'plan-of-study';

//-----------------------------------------------------------------------
  ///notifications
  static const String notification = 'notifications/all';
  static const String updateNewToUnread = 'notifications/update-new-to-unread';
  static const String markNotificationAsRead = 'notifications/mark-as-read';
  static const String markAllNotificationsAsRead =
      'notifications/mark-all-as-read';

  //-----------------------------------------------------------------------
  ///letters
  static const String letters = 'letters';
  static const String lettersShow = 'letters/';

  //-----------------------------------------------------------------------
  ///finance
  static const String finance = 'finance/invoices';
  static const String financePay = 'finance/pay';

  //-----------------------------------------------------------------------
  ///term registration
  static const String availabilityTermRegistration = 'registration/term';
  static const String termRegisterPay = 'registration/term/pay';

  //-----------------------------------------------------------------------
  ///public services
  static const String faq = 'faqs';
  static const String home = 'home';
  static const String checkFiles = 'check-files';
  static const String editProfile = 'edit-profile';
  static const String lectureTable = 'lecture-table';
  static const String schedule = 'schedule';
  static const String accessToMoodle = 'access-to-moodle';
}

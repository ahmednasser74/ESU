 class Endpoints {
  static const String baseUrl = 'https://sisv2.esu.ac.ae/api/';

//-----------------------------------------------------------------------
  ///Auth
  static const String admission = 'admission';
  static const String login = 'login';

//-----------------------------------------------------------------------
  ///lookup
  static const String lookup = 'lookup/get';
  static const String transcript = 'transcript';
  static const String planOfStudy = 'plan-of-study';

//-----------------------------------------------------------------------
  ///notifications
  static const String notification = 'notifications/all';
  static const String updateNewToUnread = 'notifications/update-new-to-unread';
  static const String markAsRead = 'notifications/mark-as-read';
  static const String markAllAsRead = 'notifications/mark-all-as-read';
//-----------------------------------------------------------------------
  ///letters
  static const String letters = 'letters';
  static const String lettersShow = 'letters/';


}

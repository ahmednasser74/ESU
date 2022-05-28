import 'package:boilerplate/core/localization/localization_keys.dart';

const Map<String, String> en = {
  //-------------------------------------------------------------------------
  ///login
  LocalizationKeys.login: "Login",
  LocalizationKeys.password: "Password",
  LocalizationKeys.changePassword: "Change Password",
  LocalizationKeys.userName: "User name",
  LocalizationKeys.studentId: "Student ID",
  LocalizationKeys.doNotHaveAccount: "Don't have an account ?\n",
  LocalizationKeys.signUp: "SignUp!",
  LocalizationKeys.admission: "Admission",
  LocalizationKeys.emailIsRequired: "Email is required",
  LocalizationKeys.passwordIsRequired: "Password is required",
  LocalizationKeys.passwordMustContain:
      "Password must contain at least one uppercase, one lowercase, one number and one special character",
  LocalizationKeys.enterValidEmailFormat: "Enter valid email format",
  LocalizationKeys.enterValidFormat: "Enter valid format",
  LocalizationKeys.atLeast3Characters: "At least 3 characters",
  LocalizationKeys.atLeast6Characters: "At least 6 characters",
  LocalizationKeys.atLeast8Characters: "At least 8 characters",
  LocalizationKeys.atLeast10Characters: "At least 10 characters",
  LocalizationKeys.forgetPassword: "Forget Password ?",
  LocalizationKeys.resetPassword: "Reset Password",
  LocalizationKeys.enterCode: "Enter Code",
  LocalizationKeys.verificationCode: "Verification Code",
  LocalizationKeys.passwordConfirmationNotMatchedWithPassword:
      "Password confirmation not matched with password",
  LocalizationKeys.congratulationYouHaveSuccessfullyChangedYourPassword:
      'Congratulation! You have successfully changed your password',
  LocalizationKeys.goToLogin: 'Go to login',
  LocalizationKeys.verificationCodeSentToEmail:
      'Verification code sent to email',
//-------------------------------------------------------------------------
  ///academic info
  LocalizationKeys.academicInformation: 'Academic Information',
  LocalizationKeys.currentCertificate: 'Current Certificate',
  LocalizationKeys.program: 'Program',
  LocalizationKeys.next: 'Next',
  LocalizationKeys.select: 'Select',
  LocalizationKeys.secondarySchool: 'Secondary School',
  LocalizationKeys.master: 'Master',
  LocalizationKeys.bachelor: 'Bachelor\'s',

  //-------------------------------------------------------------------------
  ///personal info
  LocalizationKeys.personalInformation: 'Personal Information',
  LocalizationKeys.email: 'Email',
  LocalizationKeys.yourFirstNameEnglish: 'Your first name (English)',
  LocalizationKeys.yourSecondNameEnglish: 'Your second name (English)',
  LocalizationKeys.yourLastNameEnglish: 'Your last name (English)',
  LocalizationKeys.yourFirstNameArabic: 'Your first name (Arabic)',
  LocalizationKeys.yourSecondNameArabic: 'Your second name (Arabic)',
  LocalizationKeys.yourLastNameArabic: 'Your last name (Arabic)',
  LocalizationKeys.nationalIdPassportNumber: 'National ID/Passport Number',
  LocalizationKeys.dateOfBirth: 'Date of Birth',
  LocalizationKeys.mobileNumber: 'Mobile Number',
  LocalizationKeys.gender: 'Gender',
  LocalizationKeys.male: 'Male',
  LocalizationKeys.female: 'Female',
  LocalizationKeys.country: 'Country',
  LocalizationKeys.nationality: 'Nationality',
  LocalizationKeys.yourJob: 'Your job',
  LocalizationKeys.yourCompany: 'Your Company',
  LocalizationKeys.currentAddress: 'Current Address',

  //-------------------------------------------------------------------------
  ///files upload
  LocalizationKeys.filesUpload: 'Files Upload',
  LocalizationKeys.copyOfYourIdOrPassport: 'A copy of your ID or passport',
  LocalizationKeys.copyOfTheAcademicCertificate:
      'A copy of the academic certificate',
  LocalizationKeys.copyOfTranscript: ' copy of transcript',
  LocalizationKeys.copyOfTheStudentsContractWithTheUniversity:
      'A copy of the students contract with the university',
  LocalizationKeys.bachelorMasterContractDownloadLink:
      '(Bachelor/Master contract download link)',
  LocalizationKeys.phdContractDownloadLink: '(PHD contract download link)',
  LocalizationKeys.theContractMustBeSignedHandwrittenAndOnAllPages:
      'The contract must be signed handwritten and on all pages!',
  LocalizationKeys.uploadCv: 'Upload CV',

  //-------------------------------------------------------------------------
  ///submit registration
  LocalizationKeys.submitRegistration: 'Submit Registration',
  LocalizationKeys.weRecommendToUseEmail:
      'We recommend not to use the e-mail from (hotmail.com) company, as they have a problem with some e-mails not being sent to them.',
  LocalizationKeys.iReadAndAgree: 'I read and agree to ',
  LocalizationKeys.termsAndCondition: 'The terms and conditions of admission',
  LocalizationKeys.mustToApproveOnTermsAndCondition:
      'Must to approve on terms and condition',
  LocalizationKeys.success: 'Success',
  LocalizationKeys.submit: 'Submit',

  //-------------------------------------------------------------------------
  ///Home
  LocalizationKeys.home: 'Home',
  LocalizationKeys.balance: 'Balance',
  LocalizationKeys.totalAmount: 'Total Amount',
  LocalizationKeys.totalAmountPaid: 'Total Amount Paid',
  LocalizationKeys.totalAmountUnpaid: 'Total Amount Unpaid',
  LocalizationKeys.programAmount: 'Program Amount',
  LocalizationKeys.paidAmount: 'Paid Amount',
  LocalizationKeys.unPaidAmount: 'UnPaid Amount',
  LocalizationKeys.aed: 'AED',

  //-------------------------------------------------------------------------
  ///Profile
  LocalizationKeys.profile: 'Profile',
  LocalizationKeys.passwordConfirmation: 'Password Confirmation',
  LocalizationKeys.fullNameEnglish: 'Full Name (English)',
  LocalizationKeys.fullNameArabic: 'Full Name (Arabic)',
  LocalizationKeys.updateProfile: 'Update Profile',
  LocalizationKeys.selectFile: 'Select File',
  LocalizationKeys.selectPhoto: 'Select Photo',
  LocalizationKeys.maxFileSizeIsTenMegabytes: 'Max file size is 10 megabytes',
  LocalizationKeys.sorryThisFileTypeIsNotAllowed:
      'Sorry this file type is not allowed',

  //-------------------------------------------------------------------------
  ///Notification
  LocalizationKeys.notification: 'Notification',
  LocalizationKeys.noNotificationFound: 'No Notification Found',
  LocalizationKeys.filterByType: 'Filter By Type',
  LocalizationKeys.all: 'All',
  LocalizationKeys.unread: 'Unread',
  LocalizationKeys.read: 'Read',
  LocalizationKeys.neww: 'New',
  LocalizationKeys.markAllAsRead: 'Mark All As Read',
  LocalizationKeys.failedMarkAllAsRead: 'Failed Mark All As Read',
  LocalizationKeys.successMarkAllAsRead: 'Success Mark All As Read',
  //-------------------------------------------------------------------------
  ///Finance
  LocalizationKeys.finance: 'Finance',
  LocalizationKeys.status: 'Status',
  LocalizationKeys.paid: 'Paid',
  LocalizationKeys.total: 'Total',
  LocalizationKeys.paidAt: 'Paid At',
  LocalizationKeys.waiting: 'Waiting...',
  LocalizationKeys.noDataFound: 'No Data Found',

  //-------------------------------------------------------------------------
  ///Letters
  LocalizationKeys.letters: 'Letters',
  LocalizationKeys.englishVersion: 'English Version',
  LocalizationKeys.arabicVersion: 'Arabic Version',
  LocalizationKeys.noLettersFound: 'No Letters Found',
  LocalizationKeys.letterPdfViewer: 'Letter Pdf Viewer',

  //-------------------------------------------------------------------------
  ///Transcript
  LocalizationKeys.transcript: 'Transcript',

  //-------------------------------------------------------------------------
  ///Settings
  LocalizationKeys.settings: 'Settings',
  LocalizationKeys.language: 'Language',

  //-------------------------------------------------------------------------
  ///study plans
  LocalizationKeys.studyPlans: 'Study Plans',
  LocalizationKeys.noStudyPlansFound: 'No Study Plans Found',
  LocalizationKeys.hours: 'Hours',
  LocalizationKeys.code: 'Code',
  LocalizationKeys.prerequisites: 'Prerequisites',

  //-------------------------------------------------------------------------
  ///student card
  LocalizationKeys.studentCard: 'Student Card',
  LocalizationKeys.studentName: 'Student Name',

  //-------------------------------------------------------------------------
  ///global
  LocalizationKeys.logout: 'Logout',
  LocalizationKeys.thisFieldIsRequired: 'This field is required',
  LocalizationKeys.doYouWantToLogout: 'Do you want to logout?',
  LocalizationKeys.cancel: 'Cancel',
  LocalizationKeys.completeAllTheFields: 'Complete all the fields',
  LocalizationKeys.somethingWentWrong: 'Something went wrong',
  LocalizationKeys.somethingWentWrongTryAgain:
      'Something went wrong, try again',
  LocalizationKeys.hello: 'Hello',
};

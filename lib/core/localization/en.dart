import 'package:esu/core/localization/localization_keys.dart';

const Map<String, String> en = {
  ///splash
  LocalizationKeys.thereInAnUpdateAvailable: 'There is an update available',
  LocalizationKeys.youShouldUpdateTheAppToContinueUsingIt:
      'You should update the app to continue using it',
  LocalizationKeys.update: 'Update',

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
  LocalizationKeys.enterEmail: "Enter Email",
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
  LocalizationKeys.goToProfile: 'Go to Profile',
  LocalizationKeys.goToInvoice: 'Go to Invoice',
  LocalizationKeys.youMustCompleteProfileFilesToCompleteAnyProcess:
      'You must complete profile files to complete any process',
  LocalizationKeys.youMustPayInvoiceToCompleteAnyProcess:
      'You must pay invoice to complete any process',

  //-------------------------------------------------------------------------
  ///Profile
  LocalizationKeys.profile: 'Profile',
  LocalizationKeys.passwordConfirmation: 'Password Confirmation',
  LocalizationKeys.fullNameEnglish: 'Full Name (English)',
  LocalizationKeys.fullNameArabic: 'Full Name (Arabic)',
  LocalizationKeys.updateProfile: 'Update Profile',
  LocalizationKeys.selectFile: 'Select File',
  LocalizationKeys.selectPhoto: 'Select Photo',
  LocalizationKeys.selectPhotoSource: 'Select Photo Source',
  LocalizationKeys.camera: 'Camera',
  LocalizationKeys.gallery: 'Gallery',
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
  LocalizationKeys.pay: 'Pay',
  LocalizationKeys.payment: 'Payment',
  LocalizationKeys.noDataFound: 'No Data Found',
  LocalizationKeys.dueDate: 'Due Date',
  LocalizationKeys.remaining: 'Remaining',
  LocalizationKeys.notPutTillNow: 'Not Put Till Now',
  LocalizationKeys.waitingForPayment: 'Waiting For Payment GateWay',

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
  ///FAQ
  LocalizationKeys.faq: 'FAQ',

  //-------------------------------------------------------------------------
  ///access to moodle
  LocalizationKeys.accessToMoodle: 'Access To Moodle',
  LocalizationKeys.goToMoodle: 'Go To Moodle',
  LocalizationKeys.moodleUrl: 'Moodle Url',
  LocalizationKeys.playVideo: 'Play Video',

  //-------------------------------------------------------------------------
  ///lecture table
  LocalizationKeys.lectureTable: 'Lecture Table',
  LocalizationKeys.noLectureFound: 'No Lecture Found',
  LocalizationKeys.lecture: 'Lecture',
  LocalizationKeys.teacherName: 'Teacher Name',
  LocalizationKeys.weeklyLecture: 'Weekly Lecture',
  LocalizationKeys.note: 'Note',
  LocalizationKeys.courseCode: 'Course Code',

  //-------------------------------------------------------------------------
  ///schedule
  LocalizationKeys.schedule: 'Schedule',

  //-------------------------------------------------------------------------
  ///term registration
  LocalizationKeys.termRegistration: 'Term Registration',
  LocalizationKeys.registerForTheTerm: 'Register For The Term',
  LocalizationKeys.scholarshipPercentage: 'Scholarship Percentage',
  LocalizationKeys.trimester: 'Trimester',
  LocalizationKeys.cost: 'Cost',

  //-------------------------------------------------------------------------
  ///tickets
  LocalizationKeys.tickets: 'Tickets',
  LocalizationKeys.ticket: 'Ticket',
  LocalizationKeys.noTicketsFound: 'No Tickets Found',
  LocalizationKeys.ticketNumber: 'Ticket Number',
  LocalizationKeys.ticketDate: 'Ticket Date',
  LocalizationKeys.ticketStatus: 'Ticket Status',
  LocalizationKeys.ticketType: 'Ticket Type',
  LocalizationKeys.ticketDescription: 'Ticket Description',
  LocalizationKeys.ticketSolution: 'Ticket Solution',
  LocalizationKeys.ticketSolutionDate: 'Ticket Solution Date',
  LocalizationKeys.ticketIsClosed: 'Ticket Is Closed',
  LocalizationKeys.ticketDetails: 'Ticket Details',
  LocalizationKeys.ticketSupport: 'Ticket Support',
  LocalizationKeys.ticketCreated: 'Ticket Created',
  LocalizationKeys.ticketCreate: 'Ticket Create',
  LocalizationKeys.addTicket: 'Add Ticket',
  LocalizationKeys.replyAddedSuccessfully: 'Reply Added Successfully',
  LocalizationKeys.sorryCannotAddReplyBecauseTicketIsClosed:
      'Sorry Cannot Add Reply Because Ticket Is Closed',
  LocalizationKeys.createdBy: 'Created By',
  LocalizationKeys.category: 'Category',
  LocalizationKeys.subject: 'Subject',
  LocalizationKeys.body: 'Body',
  LocalizationKeys.pleaseEnterValidSubject: 'Please Enter Valid Subject',
  LocalizationKeys.pleaseEnterValidBody: 'Please Enter Valid Body',
  LocalizationKeys.pleaseSelectCategory: 'Please Select Category',
  LocalizationKeys.description: 'Description',
  LocalizationKeys.categories: 'Categories',
  LocalizationKeys.noRepliesFound: 'No Replies Found',
  LocalizationKeys.reply: 'Reply',
  LocalizationKeys.message: 'Message',
  LocalizationKeys.writeReplyHere: 'Write Reply Here',
  LocalizationKeys.sendReply: 'Send Reply',
  LocalizationKeys.send: 'Send',
  LocalizationKeys.sendFile: 'Send File',
  LocalizationKeys.addTitleWithFile: 'Add Title With File',
  LocalizationKeys.pickedFile: 'Picked File',
  LocalizationKeys.pleaseAddReply: 'Please Add Reply',
  LocalizationKeys.downloadFile: 'Download File',
  LocalizationKeys.openFile: 'Open File',
  LocalizationKeys.student: 'Student',
  LocalizationKeys.shouldToGivePermissionToAccessFiles:
      'Should To Give Permission To Access Files',
  LocalizationKeys.successfullyDownloadedFileOnYourDevice:
      'Successfully Downloaded File On Your Device',

  //-------------------------------------------------------------------------
  ///course register
  LocalizationKeys.coursesRegister: 'Courses Register',
  LocalizationKeys.registerForTheCourse: 'Register For The Course',
  LocalizationKeys.course: 'Course',
  LocalizationKeys.courseHours: 'Course Hours',
  LocalizationKeys.addCourse: 'Add Course',
  LocalizationKeys.removeCourse: 'Remove Course',
  LocalizationKeys.courseName: 'Course Name',
  LocalizationKeys.noCoursesRegistered: 'No Courses Registered',
  LocalizationKeys.noCoursesAvailable: 'No Courses Available',

  //-------------------------------------------------------------------------
  ///attendance
  LocalizationKeys.attendance: 'Attendance',
  LocalizationKeys.noAttendanceFound: 'No Attendance Found',
  LocalizationKeys.attendanceDate: 'Attendance Date',
  LocalizationKeys.attendanceStatus: 'Attendance Status',
  LocalizationKeys.openTime: 'Open Time',
  LocalizationKeys.closeTime: 'Close Time',
  LocalizationKeys.absence: 'Absence',
  LocalizationKeys.isFinished: 'Is Finished',
  LocalizationKeys.details: 'Details',
  LocalizationKeys.finished: 'Finished',
  LocalizationKeys.quizzes: 'Quizzes',

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
  LocalizationKeys.done: 'Done',
  LocalizationKeys.error: 'Error',
  LocalizationKeys.failed: 'Failed',
  LocalizationKeys.successfullyDone: 'Successfully Done',
  LocalizationKeys.createdAt: 'Created At',
  LocalizationKeys.updatedAt: 'Updated At',
  LocalizationKeys.deletedAt: 'Deleted At',
  LocalizationKeys.closedAt: 'Closed At',
};

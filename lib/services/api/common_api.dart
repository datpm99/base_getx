class CommonApi {
  static String login = 'common/public/auth/login';
  static String refreshCaptcha = 'common/public/captcha/generateCaptcha/';
  static String forgetPassword = 'core/public/auth/forget-password';
  static String changePassword = 'core/user/private/change-password';
  static String firstTimeLogin = 'core/user/private/update-first-time-login';
  static String loginOutSide = 'common/public/auth/loginByEmailAndCode';
  static String renewCode = 'core/contract/document/public/renew-verification-code';

  //User.
  static String getProfile = 'core/user/private/get-user-profile';
  static String saveFcmToken = 'core/notification/private/save-fcm-token';
  static String getCusSupport = 'core/system-parameter/private/find-system-parameters-over-systems/CSKH';
  static String globalAppNotification = 'notification/public/global-app-notification';

  //Get data demo.
  static String getUsers = 'users';
  static String createUser = 'users';
}

class Endpoints {
  static const String baseURL = "http://api.test.apti.us";
  static const String sendEmailURL =
      "${baseURL}/api/services/app/EmailVerifications/SendEmailVerificationCode";
  static const String verifyEmailURL =
      "${baseURL}/api/services/app/EmailVerifications/VerifyEmailVerificationCode";
  static const String registerURL =
      "${baseURL}/api/services/app/Account/RegisterFromMobile";
}

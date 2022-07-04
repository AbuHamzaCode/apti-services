class LoginResponseSuccess {
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  bool? shouldResetPassword;
  String? passwordResetCode;
  int? userId;
  bool? requiresTwoFactorVerification;
  List<Map<String, dynamic>>? twoFactorAuthProviders;
  String? twoFactorRememberClientToken;
  String? returnUrl;
  String? refreshToken;
  int? refreshTokenExpireInSeconds;

  LoginResponseSuccess({
      this.accessToken,
      this.encryptedAccessToken,
      this.expireInSeconds,
      this.shouldResetPassword,
      this.passwordResetCode,
      this.userId,
      this.requiresTwoFactorVerification,
      this.twoFactorAuthProviders,
      this.twoFactorRememberClientToken,
      this.returnUrl,
      this.refreshToken,
      this.refreshTokenExpireInSeconds});


  LoginResponseSuccess.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    encryptedAccessToken = json['encryptedAccessToken'];
    expireInSeconds = json['expireInSeconds'];
    shouldResetPassword = json['shouldResetPassword'];
    passwordResetCode = json['passwordResetCode'];
    userId = json['userId'];
    requiresTwoFactorVerification = json['requiresTwoFactorVerification'];
    twoFactorAuthProviders = json['twoFactorAuthProviders'];
    twoFactorRememberClientToken = json['twoFactorRememberClientToken'];
    returnUrl = json['returnUrl'];
    refreshToken = json['refreshToken'];
    refreshTokenExpireInSeconds = json['refreshTokenExpireInSeconds'];
  }
}

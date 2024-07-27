class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Geçersiz giriş bilgileri. Lütfen bilgilerinizi iki kez kontrol edin.';
      case 'too-many-requests':
        return 'Çok fazla istek var. Lütfen daha sonra tekrar deneyin.';
      case 'invalid-argument':
        return 'Kimlik doğrulama yöntemine geçersiz bağımsız değişken sağlandı.';
      case 'invalid-password':
        return 'Yanlış şifre. Lütfen tekrar deneyiniz.';
      case 'invalid-phone-number':
        return 'Verilen telefon numarası geçersiz.';
      case 'operation-not-allowed':
        return 'Oturum açma sağlayıcısı Firebase projeniz için devre dışı bırakıldı.';
      case 'session-cookie-expired':
        return 'Firebase oturum çerezinin süresi doldu. Lütfen tekrar giriş yapın.';
      case 'uid-already-exists':
        return 'Sağlanan kullanıcı kimliği zaten başka bir kullanıcı tarafından kullanılıyor.';
      case 'sign_in_failed':
        return 'Oturum açma başarısız oldu. Lütfen tekrar deneyin.';
      case 'network-request-failed':
        return 'Ağ isteği başarısız oldu. Lütfen internet bağlantınızı kontrol edin.';
      case 'internal-error':
        return 'Internal error. Please try again later.';
      case 'invalid-verification-code':
        return 'Geçersiz doğrulama kodu. Lütfen geçerli bir kod girin. ';
      case 'invalid-verification-id':
        return 'Geçersiz doğrulama kimliği. Lütfen yeni bir doğrulama kodu talep edin.';
      default:
        return 'Beklenmeyen bir platform hatası oluştu. Lütfen tekrar deneyin.';
    }
  }
}

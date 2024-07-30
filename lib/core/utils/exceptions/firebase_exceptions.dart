class TFirebaseException implements Exception {
  TFirebaseException(this.code);
  final String code;

  String get message {
    switch (code) {
      case 'unknown':
        return 'Bilinmeyen bir Firebase hatası oluştu. Lütfen tekrar deneyin.';
      case 'invalid-custom-token':
        return '''
Özel belirteç biçimi yanlış. Lütfen özel belirtecinizi kontrol edin.''';
      case 'custom-token-mismatch':
        return 'Özel belirteç farklı bir kitleye karşılık gelir.';
      case 'user-disabled':
        return 'Kullanıcı hesabı devre dışı bırakıldı.';
      case 'user-not-found':
        return 'Verilen e-posta veya UID için kullanıcı bulunamadı.';
      case 'invalid-email':
        return '''
Verilen e-posta adresi geçersiz. Lütfen geçerli bir e-posta adresi girin.''';
      case 'email-already-in-use':
        return '''
E-posta adresi zaten kayıtlı. Lütfen farklı bir e-posta kullanın.''';
      case 'wrong-password':
        return 'Yanlış şifre. Lütfen şifrenizi kontrol edin ve tekrar deneyin.';
      case 'weak-password':
        return 'Şifre çok zayıf. Lütfen daha güçlü bir şifre seçin.';
      case 'provider-already-linked':
        return 'Hesap zaten başka bir sağlayıcı ile bağlantılıdır.';
      case 'operation-not-allowed':
        return '''
Bu işleme izin verilmez. Yardım için destek ekibiyle iletişime geçin.''';
      case 'invalid-credential':
        return '''
Sağlanan kimlik bilgisi hatalı biçimlendirilmiş veya süresi dolmuş.''';
      case 'invalid-verification-code':
        return 'Geçersiz doğrulama kodu. Lütfen geçerli bir kod girin.';
      case 'invalid-verification-id':
        return '''
Geçersiz doğrulama kimliği. Lütfen yeni bir doğrulama kodu talep edin.''';
      case 'captcha-check-failed':
        return 'reCAPTCHA yanıtı geçersiz. Lütfen tekrar deneyin.';
      case 'app-not-authorized':
        return '''
Uygulama, sağlanan API anahtarıyla Firebase Kimlik Doğrulaması'nı kullanma yetkisine sahip değil.''';
      case 'keychain-error':
        return '''
Bir anahtar zinciri hatası oluştu. Lütfen anahtarlığı kontrol edin ve tekrar deneyin.''';
      case 'internal-error':
        return '''
Dahili bir kimlik doğrulama hatası oluştu. Lütfen daha sonra tekrar deneyin.''';
      default:
        return 'Beklenmeyen bir Firebase hatası oluştu. Lütfen tekrar deneyin.';
    }
  }
}

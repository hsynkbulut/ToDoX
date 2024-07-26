class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'E-posta adresi zaten kayıtlı. Lütfen farklı bir e-posta kullanın.';
      case 'invalid-email':
        return 'Verilen e-posta adresi geçersiz. Lütfen geçerli bir e-posta adresi girin.';
      case 'weak-password':
        return 'Şifre çok zayıf. Lütfen daha güçlü bir şifre seçin.';
      case 'user-disabled':
        return 'Bu kullanıcı hesabı devre dışı bırakıldı. Lütfen yardım için destek ekibiyle iletişime geçin.';
      case 'user-not-found':
        return 'Geçersiz giriş bilgileri. Kullanıcı bulunamadı.';
      case 'wrong-password':
        return 'Yanlış şifre. Lütfen şifrenizi kontrol edin ve tekrar deneyin.';
      case 'invalid-verification-code':
        return 'Geçersiz doğrulama kodu. Lütfen geçerli bir kod girin.';
      case 'invalid-verification-id':
        return 'Geçersiz doğrulama kimliği. Lütfen yeni bir doğrulama kodu talep edin.';
      case 'quota-exceeded':
        return 'Kota aşıldı. Lütfen daha sonra tekrar deneyin.';
      case 'email-already-exists':
        return 'E-posta adresi zaten mevcut. Lütfen farklı bir e-posta adresi kullanın.';
      case 'provider-already-linked':
        return 'Hesap zaten başka bir sağlayıcı ile bağlantılıdır.';
      case 'operation-not-allowed':
        return 'Bu işleme izin verilmez. Yardım için destek ekibiyle iletişime geçin.';
      case 'invalid-credential':
        return 'Sağlanan kimlik bilgisi hatalı biçimlendirilmiş veya süresi dolmuş.';
      case 'captcha-check-failed':
        return 'reCAPTCHA yanıtı geçersiz. Lütfen tekrar deneyin.';
      case 'app-not-authorized':
        return 'Uygulama, sağlanan API anahtarıyla Firebase Kimlik Doğrulaması\'nı kullanma yetkisine sahip değil.';
      case 'keychain-error':
        return 'Bir anahtar zinciri hatası oluştu. Lütfen anahtarlığı kontrol edin ve tekrar deneyin.';
      case 'internal-error':
        return 'Dahili bir kimlik doğrulama hatası oluştu. Lütfen daha sonra tekrar deneyin.';
      case 'invalid-app-credential':
        return 'Uygulama kimlik bilgisi geçersiz. Lütfen geçerli bir uygulama kimlik bilgisi sağlayın.';
      case 'user-mismatch':
        return 'Sağlanan kimlik bilgileri daha önce oturum açmış kullanıcıya karşılık gelmiyor.';
      case 'requires-recent-login':
        return 'Bu işlem hassastır ve yeni kimlik doğrulaması gerektirir. Lütfen tekrar giriş yapın.';
      case 'account-exists-with-different-credential':
        return 'Aynı e-posta adresiyle ancak farklı oturum açma kimlik bilgileriyle bir hesap zaten mevcut.';
      case 'missing-iframe-start':
        return 'E-posta şablonunda iframe başlangıç etiketi eksik.';
      case 'missing-iframe-end':
        return 'E-posta şablonunda iframe bitiş etiketi eksik.';
      case 'missing-iframe-src':
        return 'E-posta şablonunda iframe src özniteliği eksik.';
      case 'auth-domain-config-required':
        return 'Eylem kodu doğrulama bağlantısı için authDomain yapılandırması gereklidir.';
      case 'missing-app-credential':
        return 'Uygulama kimlik bilgileri eksik. Lütfen geçerli uygulama kimlik bilgilerini sağlayın.';
      case 'session-cookie-expired':
        return 'Firebase oturum çerezinin süresi doldu. Lütfen tekrar giriş yapın.';
      case 'uid-already-exists':
        return 'Sağlanan kullanıcı kimliği zaten başka bir kullanıcı tarafından kullanılıyor.';
      case 'web-storage-unsupported':
        return 'Web depolama desteklenmiyor veya devre dışı bırakılmış.';
      case 'app-deleted':
        return 'Bu FirebaseApp örneği silindi.';
      case 'user-token-mismatch':
        return 'Sağlanan kullanıcı belirteci, kimliği doğrulanmış kullanıcının kullanıcı kimliği ile uyuşmuyor.';
      case 'invalid-message-payload':
        return 'E-posta şablonu doğrulama mesajı yükü geçersiz.';
      case 'invalid-sender':
        return 'E-posta şablonu göndericisi geçersiz. Lütfen gönderenin e-postasını doğrulayın.';
      case 'invalid-recipient-email':
        return 'Alıcı e-posta adresi geçersiz. Lütfen geçerli bir alıcı e-postası sağlayın.';
      case 'missing-action-code':
        return 'Eylem kodu eksik. Lütfen geçerli bir eylem kodu girin.';
      case 'user-token-expired':
        return 'Kullanıcının belirtecinin süresi doldu ve kimlik doğrulaması gerekiyor. Lütfen tekrar oturum açın.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Geçersiz oturum açma bilgileri.';
      case 'expired-action-code':
        return 'Eylem kodunun süresi doldu. Lütfen yeni bir eylem kodu talep edin.';
      case 'invalid-action-code':
        return 'Eylem kodu geçersiz. Lütfen kodu kontrol edin ve tekrar deneyin.';
      case 'credential-already-in-use':
        return 'Bu kimlik bilgisi zaten farklı bir kullanıcı hesabıyla ilişkilendirilmiştir.';
      default:
        return 'Beklenmeyen bir Firebase hatası oluştu. Lütfen tekrar deneyin.';
    }
  }
}

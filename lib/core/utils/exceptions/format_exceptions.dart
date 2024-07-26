class TFormatException implements Exception {
  final String message;

  const TFormatException(
      [this.message =
          'Beklenmeyen bir format hatası oluştu. Lütfen girişinizi kontrol edin']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const TFormatException('Geçerli bir e-posta adresi değil.');
      case 'invalid-email-format':
        return const TFormatException(
            'E-posta adresi biçimi geçersiz. Lütfen geçerli bir e-posta girin.');
      case 'invalid-phone-number':
        return const TFormatException('Geçerli bir telefon numarası değil.');
      case 'invalid-phone-number-format':
        return const TFormatException(
            'Sağlanan telefon numarası biçimi geçersiz. Lütfen geçerli bir numara girin.');
      case 'invalid-date-format':
        return const TFormatException(
            'Tarih biçimi geçersiz. Lütfen geçerli bir tarih girin.');
      case 'invalid-url-format':
        return const TFormatException(
            'URL biçimi geçersiz. Lütfen geçerli bir URL girin.');
      case 'invalid-credit-card-format':
        return const TFormatException(
            'Kredi kartı formatı geçersiz. Lütfen geçerli bir kredi kartı numarası girin.');
      case 'invalid-numeric-format':
        return const TFormatException(
            'Girdi geçerli bir sayısal formatta olmalıdır.');
      default:
        return const TFormatException();
    }
  }
}

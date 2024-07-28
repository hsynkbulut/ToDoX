class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName alanı boş bırakılamaz';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-posta adresi alanı boş bırakılamaz';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Geçersiz e-posta adresi';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre alanı boş bırakılamaz';
    }

    if (value.length < 8) {
      return 'Şifre en az 8 karakter uzunluğunda olmalıdır.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Şifre en az bir büyük harf içermelidir.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Şifre en az bir sayı içermelidir.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Şifre en az bir özel karakter içermelidir.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon numarası alanı boş bırakılamaz';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Geçersiz telefon numarası biçimi. Başında 0 olmadan yazın.';
    }

    return null;
  }
}

// TextUtilities: Text processing utilities
class TextUtilities {
  // ignore: lines_longer_than_80_chars
  // Calculates reading time for the given content based on an average reading speed of 225 words per minute.
  static int calculateReadingTime(String content) {
    final wordCount = content.split(RegExp(r'\s+')).length;
    final readingTime = wordCount / 225;
    return readingTime.ceil();
  }
}

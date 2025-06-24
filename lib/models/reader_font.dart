enum ReaderFont {
  system,
  openSans,
  merriweather,
  lora,
  sourceSerif,
  playfair,
  montserrat;

  String get key {
    switch (this) {
      case ReaderFont.system:
        return 'system';
      case ReaderFont.openSans:
        return 'open_sans';
      case ReaderFont.merriweather:
        return 'merriweather';
      case ReaderFont.lora:
        return 'lora';
      case ReaderFont.sourceSerif:
        return 'source_serif';
      case ReaderFont.playfair:
        return 'playfair';
      case ReaderFont.montserrat:
        return 'montserrat';
    }
  }

  static ReaderFont fromKey(String key) {
    return ReaderFont.values.firstWhere(
      (font) => font.key == key,
      orElse: () => ReaderFont.system,
    );
  }

  String get toFontFamily {
    switch (this) {
      case ReaderFont.system:
        return 'Roboto';
      case ReaderFont.openSans:
        return 'Open Sans';
      case ReaderFont.merriweather:
        return 'Merriweather';
      case ReaderFont.lora:
        return 'Lora';
      case ReaderFont.sourceSerif:
        return 'Source Serif 4';
      case ReaderFont.playfair:
        return 'Playfair';
      case ReaderFont.montserrat:
        return 'Montserrat';
    }
  }

  String? get toOFLName {
    switch (this) {
      case ReaderFont.system:
        return 'Roboto-OFL.txt';
      case ReaderFont.openSans:
        return 'OpenSans-OFL.txt';
      case ReaderFont.merriweather:
        return 'Merriweather-OFL.txt';
      case ReaderFont.lora:
        return 'Lora-OFL.txt';
      case ReaderFont.sourceSerif:
        return 'SourceSerif4-OFL.txt';
      case ReaderFont.playfair:
        return 'Playfair-OFL.txt';
      case ReaderFont.montserrat:
        return 'Montserrat-OFL.txt';
    }
  }

  String get name {
    switch (this) {
      case ReaderFont.system:
        return 'Roboto';
      case ReaderFont.openSans:
        return 'Open Sans';
      case ReaderFont.merriweather:
        return 'Merriweather';
      case ReaderFont.lora:
        return 'Lora';
      case ReaderFont.sourceSerif:
        return 'Source Serif';
      case ReaderFont.playfair:
        return 'Playfair';
      case ReaderFont.montserrat:
        return 'Montserrat';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ta', 'kn', 'ml'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? taText = '',
    String? knText = '',
    String? mlText = '',
  }) =>
      [enText, taText, knText, mlText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    '6qny7xe3': {
      'en': 'Login',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
      'ml': 'ലോഗിൻ',
      'ta': 'உள்நுழைக',
    },
    '5c9tszr5': {
      'en': 'Let\'s get started by filling out the form below.',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸೋಣ.',
      'ml': 'ചുവടെയുള്ള ഫോം പൂരിപ്പിച്ച് നമുക്ക് ആരംഭിക്കാം.',
      'ta': 'கீழே உள்ள படிவத்தை நிரப்புவதன் மூலம் தொடங்குவோம்.',
    },
    'r3bya68x': {
      'en': 'Email',
      'kn': 'ಇಮೇಲ್',
      'ml': 'ഇമെയിൽ',
      'ta': 'மின்னஞ்சல்',
    },
    'nzxdjz1c': {
      'en': 'Password',
      'kn': 'ಪಾಸ್ವರ್ಡ್',
      'ml': 'രഹസ്യവാക്ക്',
      'ta': 'கடவுச்சொல்',
    },
    '755sm0b8': {
      'en': 'Login',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
      'ml': 'ലോഗിൻ',
      'ta': 'உள்நுழைக',
    },
    'fuasnkqd': {
      'en': 'Continue with Google',
      'kn': 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಯಿರಿ',
      'ml': 'Google-ൽ തുടരുക',
      'ta': 'Google உடன் தொடரவும்',
    },
    '6bftzc7d': {
      'en': 'Don\'t Have a Account',
      'kn': 'ಖಾತೆಯನ್ನು ಹೊಂದಿಲ್ಲ',
      'ml': 'ഒരു അക്കൗണ്ട് ഇല്ല',
      'ta': 'கணக்கு இல்லை',
    },
    'jqsq20by': {
      'en': ' Sign Up here',
      'kn': 'ಇಲ್ಲಿ ಸೈನ್ ಅಪ್ ಮಾಡಿ',
      'ml': 'ഇവിടെ സൈൻ അപ്പ് ചെയ്യുക',
      'ta': 'இங்கே பதிவு செய்யவும்',
    },
    'xbdui7ql': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // OnBoadingPage
  {
    'czrfnnth': {
      'en': 'Sign Sense',
      'kn': 'ಸೈನ್ ಸೆನ್ಸ್',
      'ml': 'സൈൻ സെൻസ്',
      'ta': 'சைன் சென்ஸ்',
    },
    '7lrpfx70': {
      'en': 'Hands on ISL',
      'kn': 'ISL ಮೇಲೆ ಕೈ',
      'ml': 'ഐഎസ്എല്ലിൽ കൈകോർക്കുന്നു',
      'ta': 'ஐ.எஸ்.எல்',
    },
    '6mcqe8lt': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // SignUpPage
  {
    'u2r0m69c': {
      'en': 'Create an account',
      'kn': 'ಖಾತೆಯನ್ನು ರಚಿಸಿ',
      'ml': 'ഒരു അക്കൗണ്ട് സൃഷ്ടിക്കുക',
      'ta': 'ஒரு கணக்கை உருவாக்கவும்',
    },
    'rtmiqua9': {
      'en': 'Let\'s get started by filling out the form below.',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸೋಣ.',
      'ml': 'ചുവടെയുള്ള ഫോം പൂരിപ്പിച്ച് നമുക്ക് ആരംഭിക്കാം.',
      'ta': 'கீழே உள்ள படிவத்தை நிரப்புவதன் மூலம் தொடங்குவோம்.',
    },
    'mx8rlfeq': {
      'en': 'Name',
      'kn': 'ಹೆಸರು',
      'ml': 'പേര്',
      'ta': 'பெயர்',
    },
    'hk0ir7qj': {
      'en': 'Email',
      'kn': 'ಇಮೇಲ್',
      'ml': 'ഇമെയിൽ',
      'ta': 'மின்னஞ்சல்',
    },
    'ez0gttpc': {
      'en': 'Password',
      'kn': 'ಪಾಸ್ವರ್ಡ್',
      'ml': 'രഹസ്യവാക്ക്',
      'ta': 'கடவுச்சொல்',
    },
    'q4zotf4v': {
      'en': 'Confirm Password',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ',
      'ml': 'പാസ്വേഡ് സ്ഥിരീകരിക്കുക',
      'ta': 'கடவுச்சொல்லை உறுதிப்படுத்தவும்',
    },
    'd0mfjl4v': {
      'en': 'Create Account',
      'kn': 'ಖಾತೆಯನ್ನು ರಚಿಸಿ',
      'ml': 'അക്കൗണ്ട് സൃഷ്ടിക്കുക',
      'ta': 'கணக்கை உருவாக்கவும்',
    },
    'ta7wge67': {
      'en': 'Continue with Google',
      'kn': 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಯಿರಿ',
      'ml': 'Google-ൽ തുടരുക',
      'ta': 'Google உடன் தொடரவும்',
    },
    '59mh4b29': {
      'en': 'Already have an account? ',
      'kn': 'ಈಗಾಗಲೇ ಖಾತೆಯನ್ನು ಹೊಂದಿರುವಿರಾ?',
      'ml': 'ഇതിനകം ഒരു അക്കൗണ്ട് ഉണ്ടോ?',
      'ta': 'ஏற்கனவே கணக்கு உள்ளதா?',
    },
    '2terwwls': {
      'en': ' Sign In here',
      'kn': 'ಇಲ್ಲಿ ಸೈನ್ ಇನ್ ಮಾಡಿ',
      'ml': 'ഇവിടെ സൈൻ ഇൻ ചെയ്യുക',
      'ta': 'இங்கே உள்நுழையவும்',
    },
    'm419ph7k': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // HomePage
  {
    '404yf3h6': {
      'en': 'Sign Sense',
      'kn': 'ಸೈನ್ ಸೆನ್ಸ್',
      'ml': 'സൈൻ സെൻസ്',
      'ta': 'சைன் சென்ஸ்',
    },
    '6xss54mg': {
      'en': 'Search members...',
      'kn': 'ಸದಸ್ಯರನ್ನು ಹುಡುಕಿ...',
      'ml': 'അംഗങ്ങളെ തിരയുക...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
    },
    '2fadjq08': {
      'en': 'Lessons',
      'kn': 'ಪಾಠಗಳು',
      'ml': 'പാഠങ്ങൾ',
      'ta': 'பாடங்கள்',
    },
    '6jif6rx4': {
      'en': 'Alphabet in Sign Language',
      'kn': 'ವರ್ಣಮಾಲೆಗಳು',
      'ml': 'അക്ഷരമാല',
      'ta': 'எழுத்துக்கள்',
    },
    'w3l0c0jr': {
      'en': 'Completed 10 out of 10',
      'kn': '10 ರಲ್ಲಿ 10 ಪೂರ್ಣಗೊಂಡಿದೆ',
      'ml': 'പത്തിൽ 10 എണ്ണം പൂർത്തിയാക്കി',
      'ta': '10க்கு 10 முடிந்தது',
    },
    'n5f30f9k': {
      'en': 'Numbers in Sign Language',
      'kn': 'ಸಂಖ್ಯೆಗಳು',
      'ml': 'നമ്പറുകൾ',
      'ta': 'எண்கள்',
    },
    'etwk1nbt': {
      'en': 'Completed 10 out of 10',
      'kn': '10 ರಲ್ಲಿ 10 ಪೂರ್ಣಗೊಂಡಿದೆ',
      'ml': 'പത്തിൽ 10 എണ്ണം പൂർത്തിയാക്കി',
      'ta': '10க்கு 10 முடிந்தது',
    },
    'm1u6l874': {
      'en': 'Basic Greetings and Expressions',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'ezjb9ahl': {
      'en': 'Completed 10 out of 10',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'l8s2dz8k': {
      'en': 'Pronouns and People',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '9ciiet3c': {
      'en': 'Completed 10 out of 10',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'r7lab4gs': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // QuizzHome
  {
    '3jtg5ljq': {
      'en': 'Sign Sense',
      'kn': 'ಸೈನ್ ಸೆನ್ಸ್',
      'ml': 'സൈൻ സെൻസ്',
      'ta': 'சைன் சென்ஸ்',
    },
    'axgdzz5u': {
      'en': 'Search members...',
      'kn': 'ಸದಸ್ಯರನ್ನು ಹುಡುಕಿ...',
      'ml': 'അംഗങ്ങളെ തിരയുക...',
      'ta': 'உறுப்பினர்களைத் தேடு...',
    },
    'czci7i7u': {
      'en': 'Quiz',
      'kn': 'ರಸಪ್ರಶ್ನೆ',
      'ml': 'ക്വിസ്',
      'ta': 'வினாடி வினா',
    },
    'g6bxpj60': {
      'en': 'Alphabet in Sign Language',
      'kn': 'ವರ್ಣಮಾಲೆಗಳು',
      'ml': 'അക്ഷരമാല',
      'ta': 'எழுத்துக்கள்',
    },
    'th935pl0': {
      'en': 'Total Number Of Questions 15',
      'kn': 'ಪ್ರಶ್ನೆಗಳ ಒಟ್ಟು ಸಂಖ್ಯೆ 15',
      'ml': 'ചോദ്യങ്ങളുടെ ആകെ എണ്ണം 15',
      'ta': 'கேள்விகளின் மொத்த எண்ணிக்கை 15',
    },
    'x1yhcd82': {
      'en': 'Numbers in Sign Language',
      'kn': 'ಸಂಖ್ಯೆಗಳು',
      'ml': 'നമ്പറുകൾ',
      'ta': 'எண்கள்',
    },
    'rao6i0sr': {
      'en': 'Total Number Of Questions 09',
      'kn': 'ಪ್ರಶ್ನೆಗಳ ಒಟ್ಟು ಸಂಖ್ಯೆ 09',
      'ml': 'ചോദ്യങ്ങളുടെ ആകെ എണ്ണം 09',
      'ta': 'கேள்விகளின் மொத்த எண்ணிக்கை 09',
    },
    '2fiymp9u': {
      'en': 'Everyday Words',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'zzkfms9w': {
      'en': 'Total Number Of Questions 09',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'ttm7r458': {
      'en': 'Forming Simple Sentences',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'w4pslfm0': {
      'en': 'Total Number Of Questions 09',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'vwitqw7u': {
      'en': 'Quiz',
      'kn': 'ರಸಪ್ರಶ್ನೆ',
      'ml': 'ക്വിസ്',
      'ta': 'வினாடி வினா',
    },
  },
  // Numbers
  {
    '62b2r04u': {
      'en': 'Numbers',
      'kn': 'ಸಂಖ್ಯೆಗಳು',
      'ml': 'നമ്പറുകൾ',
      'ta': 'எண்கள்',
    },
    'x9ep2xf3': {
      'en': 'Numbers : ',
      'kn': 'ಪತ್ರ:',
      'ml': 'കത്ത്:',
      'ta': 'கடிதம்:',
    },
    '4v4a6x86': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // Assessment
  {
    'q7vkfbry': {
      'en': 'Capture',
      'kn': 'ಬಟನ್',
      'ml': 'ബട്ടൺ',
      'ta': 'பொத்தான்',
    },
    'sl0ciqd1': {
      'en': 'Predicted Sign: ',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'thj9y56q': {
      'en': '\" \"',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'loyna6mq': {
      'en': 'Assessment',
      'kn': 'ಪುಟದ ಶೀರ್ಷಿಕೆ',
      'ml': 'പേജിൻ്റെ പേര്',
      'ta': 'பக்கத்தின் தலைப்பு',
    },
    'fsunrmkl': {
      'en': 'Assessment',
      'kn': 'ಮೌಲ್ಯಮಾಪನ',
      'ml': 'വിലയിരുത്തൽ',
      'ta': 'மதிப்பீடு',
    },
  },
  // NumberVideo
  {
    'qjr3fvq3': {
      'en': 'Video Not Uploaded ',
      'kn': 'ವೀಡಿಯೊ ಅಪ್‌ಲೋಡ್ ಆಗಿಲ್ಲ',
      'ml': 'വീഡിയോ അപ്‌ലോഡ് ചെയ്തിട്ടില്ല',
      'ta': 'வீடியோ பதிவேற்றப்படவில்லை',
    },
    'ofjl7rug': {
      'en': ':',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'khlmjov1': {
      'en': 'Numbers',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'orw9q769': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // Alphabet
  {
    'xzlrb0yb': {
      'en': 'Alphabet',
      'kn': 'ವರ್ಣಮಾಲೆ',
      'ml': 'അക്ഷരമാല',
      'ta': 'எழுத்துக்கள்',
    },
    'vgy610jt': {
      'en': 'Letter : ',
      'kn': 'ಪತ್ರ:',
      'ml': 'കത്ത്:',
      'ta': 'கடிதம்:',
    },
    '5c2u73oh': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // AlphabetVideo
  {
    'rbkv9rl7': {
      'en': 'Video Not Uploaded ',
      'kn': 'ವೀಡಿಯೊ ಅಪ್‌ಲೋಡ್ ಆಗಿಲ್ಲ',
      'ml': 'വീഡിയോ അപ്‌ലോഡ് ചെയ്തിട്ടില്ല',
      'ta': 'வீடியோ பதிவேற்றப்படவில்லை',
    },
    '987sakjj': {
      'en': 'Letter',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'vs576ylm': {
      'en': ':',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'slye48rt': {
      'en': 'Alphabets',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '1poah6g4': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // Quiz
  {
    'sb3c9erj': {
      'en': 'QUIZ',
      'kn': 'ರಸಪ್ರಶ್ನೆ',
      'ml': 'ക്വിസ്',
      'ta': 'வினாடி வினா',
    },
    '91yajbtv': {
      'en': ') ',
      'kn': ')',
      'ml': ')',
      'ta': ')',
    },
    'ggfzrdz9': {
      'en': 'Next',
      'kn': 'ಮುಂದೆ',
      'ml': 'അടുത്തത്',
      'ta': 'அடுத்து',
    },
    'tksow5ov': {
      'en': '2',
      'kn': '2',
      'ml': '2',
      'ta': '2',
    },
    'xaml8nii': {
      'en': ') ',
      'kn': ')',
      'ml': ')',
      'ta': ')',
    },
    'x47pmrqt': {
      'en': 'What Do You See In This Picture?',
      'kn': 'ಈ ಚಿತ್ರದಲ್ಲಿ ನೀವು ಏನು ನೋಡುತ್ತೀರಿ?',
      'ml': 'ഈ ചിത്രത്തിൽ നിങ്ങൾ എന്താണ് കാണുന്നത്?',
      'ta': 'இந்த படத்தில் நீங்கள் என்ன பார்க்கிறீர்கள்?',
    },
    'ugtxdqmj': {
      'en': 'D',
      'kn': 'ಡಿ',
      'ml': 'ഡി',
      'ta': 'டி',
    },
    '0gllks7t': {
      'en': 'F',
      'kn': 'ಎಫ್',
      'ml': 'എഫ്',
      'ta': 'எஃப்',
    },
    'nejz9u70': {
      'en': 'C',
      'kn': 'ಸಿ',
      'ml': 'സി',
      'ta': 'சி',
    },
    'g93706cw': {
      'en': 'A',
      'kn': 'ಎ',
      'ml': 'എ',
      'ta': 'ஏ',
    },
    'tjdl729p': {
      'en': 'Next',
      'kn': 'ಮುಂದೆ',
      'ml': 'അടുത്തത്',
      'ta': 'அடுத்து',
    },
    'qxtej1yz': {
      'en': '3',
      'kn': '3',
      'ml': '3',
      'ta': '3',
    },
    '313uugfj': {
      'en': ') ',
      'kn': ')',
      'ml': ')',
      'ta': ')',
    },
    '3j44ntaw': {
      'en': 'What Do You See In This Picture?',
      'kn': 'ಈ ಚಿತ್ರದಲ್ಲಿ ನೀವು ಏನು ನೋಡುತ್ತೀರಿ?',
      'ml': 'ഈ ചിത്രത്തിൽ നിങ്ങൾ എന്താണ് കാണുന്നത്?',
      'ta': 'இந்த படத்தில் நீங்கள் என்ன பார்க்கிறீர்கள்?',
    },
    '2psn9poa': {
      'en': 'D',
      'kn': 'ಡಿ',
      'ml': 'ഡി',
      'ta': 'டி',
    },
    'i2umkij7': {
      'en': 'F',
      'kn': 'ಎಫ್',
      'ml': 'എഫ്',
      'ta': 'எஃப்',
    },
    'p69oywfe': {
      'en': 'C',
      'kn': 'ಸಿ',
      'ml': 'സി',
      'ta': 'சி',
    },
    'vwjrefg6': {
      'en': 'A',
      'kn': 'ಎ',
      'ml': 'എ',
      'ta': 'ஏ',
    },
    'pn8ms4du': {
      'en': 'Next',
      'kn': 'ಮುಂದೆ',
      'ml': 'അടുത്തത്',
      'ta': 'அடுத்து',
    },
    '7r0okg2p': {
      'en': 'Quiz',
      'kn': 'ರಸಪ್ರಶ್ನೆ',
      'ml': 'ക്വിസ്',
      'ta': 'வினாடி வினா',
    },
  },
  // settings
  {
    '0yfoeceh': {
      'en': 'General',
      'kn': 'ಸಾಮಾನ್ಯ',
      'ml': 'ജനറൽ',
      'ta': 'பொது',
    },
    'r4drmgp2': {
      'en': 'Language',
      'kn': 'ಭಾಷೆ',
      'ml': 'ഭാഷ',
      'ta': 'மொழி',
    },
    'asbfkiyy': {
      'en': 'Dark Mode',
      'kn': 'ಡಾರ್ಕ್ ಮೋಡ್',
      'ml': 'ഡാർക്ക് മോഡ്',
      'ta': 'இருண்ட பயன்முறை',
    },
    '82zntxuq': {
      'en': 'Delete Account',
      'kn': 'ಖಾತೆಯನ್ನು ಅಳಿಸಿ',
      'ml': 'അക്കൗണ്ട് ഇല്ലാതാക്കുക',
      'ta': 'கணக்கை நீக்கு',
    },
    'p4u196o7': {
      'en': 'Logout',
      'kn': 'ಲಾಗ್ಔಟ್',
      'ml': 'പുറത്തുകടക്കുക',
      'ta': 'வெளியேறு',
    },
    'p9iuxz9k': {
      'en': 'Settings Page',
      'kn': 'ಸೆಟ್ಟಿಂಗ್‌ಗಳ ಪುಟ',
      'ml': 'ക്രമീകരണ പേജ്',
      'ta': 'அமைப்புகள் பக்கம்',
    },
    's1icwvjf': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // score
  {
    'o10z87yd': {
      'en': 'Congratulations',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '3wmf3tcy': {
      'en': 'Your Score  ',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'v13yed2n': {
      'en': '  Out Of ',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'tp7no78q': {
      'en': '10 Questions',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'fl7tk7f1': {
      'en': 'Next QuiZ',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '8bc4v500': {
      'en': 'Score',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'x58t8psu': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // Language
  {
    'rmv4rrlj': {
      'en': 'Choose Language',
      'kn': 'ಭಾಷೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഭാഷ തിരഞ്ഞെടുക്കുക',
      'ta': 'மொழியைத் தேர்ந்தெடுக்கவும்',
    },
    'h5oi2t9s': {
      'en': 'Tamil',
      'kn': 'ತಮಿಳು',
      'ml': 'തമിഴ്',
      'ta': 'தமிழ்',
    },
    '7w8f29rs': {
      'en': 'English',
      'kn': 'ಇಂಗ್ಲೀಷ್',
      'ml': 'ഇംഗ്ലീഷ്',
      'ta': 'ஆங்கிலம்',
    },
    '6akrt0en': {
      'en': 'Kannada',
      'kn': 'ಕನ್ನಡ',
      'ml': 'കന്നഡ',
      'ta': 'கன்னடம்',
    },
    'bvfl8wqo': {
      'en': 'Malayalam',
      'kn': 'ಮಲಯಾಳಂ',
      'ml': 'മലയാളം',
      'ta': 'மலையாளம்',
    },
  },
  // Dark
  {
    '9rl4plb7': {
      'en': 'Light Mode',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '4m5zeafx': {
      'en': 'Dark Mode',
      'kn': '',
      'ml': '',
      'ta': '',
    },
  },
  // Miscellaneous
  {
    'is4gn2ov': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'v8zxkc2r': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'rey2uywf': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'gplj2a6e': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'n9ec8bex': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'tpr8zzhu': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'zbznoypa': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'yqtwejlj': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'ebgoa2ea': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'fwcn1brz': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'ye8tihky': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'qncvpi3m': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'uie90tmx': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '8n6js6v5': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '0erjvial': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'mn3vusi1': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '117gsyq2': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '3yonvkd0': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '6xn494vd': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'venjahws': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'dcqx8bqs': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'q9jtyum1': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'j0qejnr6': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'vziq6459': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'pb7s67fm': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'i4qz9a2s': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '9d83fw7w': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));

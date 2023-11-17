import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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
  // Login
  {
    'obxrki42': {
      'es': 'Correo Eléctronico',
      'en': '',
    },
    '0shz2ja7': {
      'es': 'Contraseña',
      'en': '',
    },
    'jc3h8uk6': {
      'es': 'Iniciar Sesión',
      'en': '',
    },
    'wxur3m2y': {
      'es': '¿No recuerda su contraseña?',
      'en': '',
    },
    '579wxpij': {
      'es': 'Crea tu cuenta',
      'en': '',
    },
    'gam5i41i': {
      'es': 'Home',
      'en': '',
    },
  },
  // SignUp
  {
    'f02hu6tn': {
      'es': 'Nombre Completo',
      'en': '',
    },
    'yxqrqlbh': {
      'es': 'Correo Eléctronico',
      'en': '',
    },
    'eo7uudgh': {
      'es': 'Contraseña',
      'en': '',
    },
    'n0psskue': {
      'es': 'Crear Cuenta',
      'en': '',
    },
    'shx01tgp': {
      'es': '¿Ya tiene cuenta? Inicie Sesión',
      'en': '',
    },
    'cemygwqv': {
      'es': 'Home',
      'en': '',
    },
  },
  // Home
  {
    'vnt3ekan': {
      'es': 'Inicio',
      'en': '',
    },
    'ks48ycyg': {
      'es': '39',
      'en': '',
    },
    '7t71xll0': {
      'es': '150',
      'en': '',
    },
    'k5f601yq': {
      'es': '2000',
      'en': '',
    },
    'ymlfg5nn': {
      'es': '600',
      'en': '',
    },
    'pn1wiagx': {
      'es': '1400',
      'en': '',
    },
    'q1nyx79b': {
      'es': 'Próximas Citas',
      'en': '',
    },
    'l4rlw9n8': {
      'es': 'Home',
      'en': '',
    },
  },
  // Customers
  {
    'b28mjb0v': {
      'es': 'Clientes',
      'en': '',
    },
    'kh13w1uk': {
      'es': 'Agregar Cliente',
      'en': '',
    },
    'b0117kpd': {
      'es': 'Ingrese el nombre del cliente a buscar',
      'en': '',
    },
    '7ns9585y': {
      'es': '0',
      'en': '',
    },
    'o21dhs50': {
      'es': 'Home',
      'en': '',
    },
  },
  // Datoscarros
  {
    'pzykhk7g': {
      'es': 'Datos de los carros ',
      'en': '',
    },
    '7b8tnz4f': {
      'es': 'Añadir Vehiculo',
      'en': '',
    },
    '4f62ooll': {
      'es': 'Abs Blaster',
      'en': '',
    },
    'az3jlp9k': {
      'es': 'Total Workouts: ',
      'en': '',
    },
    '0bb8lh3y': {
      'es': '12',
      'en': '',
    },
    '4d9uxvnn': {
      'es': 'Home',
      'en': '',
    },
  },
  // AddVehicle
  {
    'cs85h05l': {
      'es': 'Vehiculo Nuevo',
      'en': '',
    },
    'nt0jk852': {
      'es': 'Page Title',
      'en': '',
    },
    'bavxn6p4': {
      'es': 'Home',
      'en': '',
    },
  },
  // AddCustomer
  {
    'c553wk15': {
      'es': 'Agregar Cliente     ',
      'en': '',
    },
    '51jvabjh': {
      'es': 'Ingrese el nombre del cliente',
      'en': '',
    },
    '0armx4c0': {
      'es': 'Ingrese los apellidos del cliente',
      'en': '',
    },
    'ayepxr7t': {
      'es': 'Ingrese el numero de cedula del cliente',
      'en': '',
    },
    'kskaurel': {
      'es': 'Ingrese el telefono del cliente',
      'en': '',
    },
    'yevh852a': {
      'es': 'Ingrese el correo del cliente',
      'en': '',
    },
    'ssq6ziky': {
      'es': 'Agregar Cliente',
      'en': '',
    },
    'm1i7a2r5': {
      'es': 'Home',
      'en': '',
    },
  },
  // UpdateCustomer
  {
    'nfljc95p': {
      'es': 'Actualizar Cliente     ',
      'en': '',
    },
    'yhse56k9': {
      'es': 'Ingrese el nombre del cliente',
      'en': '',
    },
    '96wwrj7n': {
      'es': 'Ingrese los apellidos del cliente',
      'en': '',
    },
    '4yvs5d2t': {
      'es': 'Ingrese el numero de cedula del cliente',
      'en': '',
    },
    '0wu8zapw': {
      'es': 'Ingrese el telefono del cliente',
      'en': '',
    },
    'hvb4yil3': {
      'es': 'Ingrese el correo del cliente',
      'en': '',
    },
    'yxqn94ur': {
      'es': 'Actualizar Cliente',
      'en': '',
    },
    'lk7xf8vr': {
      'es': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '82rl8aps': {
      'es': '',
      'en': '',
    },
    'a66psrn7': {
      'es': '',
      'en': '',
    },
    'ooabk7le': {
      'es': '',
      'en': '',
    },
    'homi69qe': {
      'es': '',
      'en': '',
    },
    'scnd1rxj': {
      'es': '',
      'en': '',
    },
    'dt7k8rby': {
      'es': '',
      'en': '',
    },
    'ex6zw61o': {
      'es': '',
      'en': '',
    },
    'xpbnms2g': {
      'es': '',
      'en': '',
    },
    'wgr2ticz': {
      'es': '',
      'en': '',
    },
    'l5wjw5bk': {
      'es': '',
      'en': '',
    },
    'zyeqr886': {
      'es': '',
      'en': '',
    },
    'i3x3eywu': {
      'es': '',
      'en': '',
    },
    'a45ma9jn': {
      'es': '',
      'en': '',
    },
    'uj86kre1': {
      'es': '',
      'en': '',
    },
    'rv256bh7': {
      'es': '',
      'en': '',
    },
    '401ertkl': {
      'es': '',
      'en': '',
    },
    'u8344s1v': {
      'es': '',
      'en': '',
    },
    '8erw70h4': {
      'es': '',
      'en': '',
    },
    'xj2n06d2': {
      'es': '',
      'en': '',
    },
    'f2i1jnmo': {
      'es': '',
      'en': '',
    },
    'w51fsusc': {
      'es': '',
      'en': '',
    },
    'lqdl86y7': {
      'es': '',
      'en': '',
    },
    't2d0354c': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));

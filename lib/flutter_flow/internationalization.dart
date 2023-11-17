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
  // Vehicles
  {
    'pzykhk7g': {
      'es': 'Vehiculos',
      'en': '',
    },
    '7b8tnz4f': {
      'es': 'Añadir Vehiculo',
      'en': '',
    },
    '0bb8lh3y': {
      'es': ' - ',
      'en': '',
    },
    '4d9uxvnn': {
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
    'c93dtzuu': {
      'es': 'Ingrese el nombre del cliente',
      'en': '',
    },
    'lvwg4qum': {
      'es': 'Ingrese los apellidos del cliente',
      'en': '',
    },
    'zu24la0b': {
      'es': 'Ingrese el numero de cedula del cliente',
      'en': '',
    },
    'zh17pu6o': {
      'es': 'Ingrese el telefono del cliente',
      'en': '',
    },
    'v1xm1l62': {
      'es': 'Ingrese el correo del cliente',
      'en': '',
    },
    '7reyi9jg': {
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
    'yx89rtjc': {
      'es': 'Ingrese el nombre del cliente',
      'en': '',
    },
    'hnzdulzm': {
      'es': 'Ingrese los apellidos del cliente',
      'en': '',
    },
    'ndlsm9t1': {
      'es': 'Ingrese el numero de cedula del cliente',
      'en': '',
    },
    '3cytz6e9': {
      'es': 'Ingrese el telefono del cliente',
      'en': '',
    },
    '3vxxjenr': {
      'es': 'Ingrese el correo del cliente',
      'en': '',
    },
    '2s94ezfp': {
      'es': 'Actualizar Cliente',
      'en': '',
    },
    'lk7xf8vr': {
      'es': 'Home',
      'en': '',
    },
  },
  // AddVehicle
  {
    '08x3bnjr': {
      'es': 'Agregar Vehiculo',
      'en': '',
    },
    'q9mknz9n': {
      'es': 'Ingrese la marca',
      'en': '',
    },
    'o0j64sc4': {
      'es': 'Ingrese el modelo',
      'en': '',
    },
    'pfr9adhb': {
      'es': 'Ingrese el año ',
      'en': '',
    },
    'lnq14rmr': {
      'es': 'Ingrese la placa',
      'en': '',
    },
    'uengq7mj': {
      'es': 'Ingrese el color',
      'en': '',
    },
    'ge48fvmp': {
      'es': 'Ingrese url de la imagen',
      'en': '',
    },
    'ymc6zj18': {
      'es': 'Agregar  Vehiculo',
      'en': '',
    },
    'z5uifcmq': {
      'es': 'Home',
      'en': '',
    },
  },
  // AddAppoiment
  {
    's86dycsn': {
      'es': 'Agregar Cita',
      'en': '',
    },
    'wgwa1rgs': {
      'es': 'Seleccionar Fecha',
      'en': '',
    },
    'ke3a9osl': {
      'es': 'Option 1',
      'en': '',
    },
    'tkqv9z6t': {
      'es': 'Please select...',
      'en': '',
    },
    'gvnfs19j': {
      'es': 'Search for an item...',
      'en': '',
    },
    'domo268e': {
      'es': 'Ingrese decripcion',
      'en': '',
    },
    'fiffciz6': {
      'es': 'Agendar Cita',
      'en': '',
    },
    'h0g3r65z': {
      'es': 'Home',
      'en': '',
    },
  },
  // AddMaintenance
  {
    'dpr6g8f3': {
      'es': 'Agregar Mantenimiento',
      'en': '',
    },
    'erfm3kwo': {
      'es': 'Ingrese el detalle',
      'en': '',
    },
    '3cmtyhg5': {
      'es': 'Ingrese la descripcion',
      'en': '',
    },
    'jw7yik4z': {
      'es': 'Ingrese el costo',
      'en': '',
    },
    'yxv2ic6w': {
      'es': 'Agregar Mantenimiento',
      'en': '',
    },
    'ce5c0za6': {
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

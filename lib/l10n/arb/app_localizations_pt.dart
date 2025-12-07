// ignore: unused_import

// Package imports:
import 'package:intl/intl.dart' as intl;

// Project imports:
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Franklyn Roberto - Portfólio';

  @override
  String get errorMessage => 'Falha ao carregar dados. Verifique sua conexão.';

  @override
  String get adminModeDetected => '🕵️ Modo Admin Detectado!';

  @override
  String get retry => 'Tentar novamente';
}

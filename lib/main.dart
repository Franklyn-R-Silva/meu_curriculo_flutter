// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'core/theme/app_theme.dart';
import 'data/repositories/portfolio_repository.dart';
import 'presentation/controllers/portfolio_controller.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MeuCurriculoApp());
}

class MeuCurriculoApp extends StatelessWidget {
  const MeuCurriculoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IPortfolioRepository>(create: (_) => PortfolioRepository()),
        ChangeNotifierProvider<PortfolioController>(
          create: (context) =>
              PortfolioController(context.read<IPortfolioRepository>()),
        ),
      ],
      child: Consumer<PortfolioController>(
        // Ouve mudanças de tema
        builder: (context, controller, child) {
          return MaterialApp(
            title: 'Franklyn Roberto - Portfólio',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: controller.themeMode, // Alterna dinamicamente
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

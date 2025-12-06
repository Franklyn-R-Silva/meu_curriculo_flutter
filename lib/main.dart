import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        // Injeção do Repository
        Provider<IPortfolioRepository>(create: (_) => PortfolioRepository()),
        // Injeção do Controller (depende do Repository)
        ChangeNotifierProvider<PortfolioController>(
          create: (context) =>
              PortfolioController(context.read<IPortfolioRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Franklyn Roberto - Portfólio',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}

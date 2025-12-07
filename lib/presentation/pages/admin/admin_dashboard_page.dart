import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/portfolio_controller.dart';
import '../../controllers/auth_controller.dart';
// ... importe seus repositórios

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PortfolioController>();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Painel Admin"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthController>().logout();
                Navigator.pop(context);
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Projetos"),
              Tab(text: "Experiência"),
              Tab(text: "Skills"),
              Tab(text: "Certificados"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(context, controller.projects, "projects"),
            _buildList(context, controller.experiences, "experiences"),
            _buildList(context, controller.skills, "skills"),
            // ... certificados
            const Center(child: Text("Certificados aqui")),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // Aqui você abriria um Dialog com campos de texto para criar um novo item
            // Ex: showDialog(context: context, builder: (_) => ProjectForm());
          },
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<dynamic> items, String table) {
    // Lista genérica simples para deletar
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        // Tenta pegar um titulo ou nome dinamicamente
        final title =
            (item as dynamic).toJson()['title'] ??
            item.toJson()['name'] ??
            item.toJson()['role'];
        final id = item.toJson()['id'];

        return ListTile(
          title: Text(title.toString()),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () async {
              // Chama o repo para deletar
              // await repo.deleteItem(table, id);
              // context.read<PortfolioController>().loadAllData();
            },
          ),
        );
      },
    );
  }
}

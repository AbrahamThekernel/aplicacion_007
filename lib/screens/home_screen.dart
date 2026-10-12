import 'package:flutter/material.dart';

import '../data/mock_weapons.dart';
import '../theme/app_theme.dart';
import '../widgets/weapon_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Todos';
  final List<String> categories = [
    'Todos',
    'Rifles de Asalto',
    'Cuerpo a Cuerpo',
    'Energía',
    'Secundarias',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredWeapons = selectedCategory == 'Todos'
        ? dummyWeapons
        : dummyWeapons.where((w) => w.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.local_fire_department, color: AppTheme.flameOrange),
            SizedBox(width: 8),
            Text('Forja de Nocturne'),
          ],
        ),
        backgroundColor: AppTheme.darkAppBar,
        foregroundColor: AppTheme.gold,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: AppTheme.gold),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppTheme.darkGreen,
                  content: Text('Accediendo al perfil del Inquisidor...'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar tecnología o arma sagrada...',
                hintStyle: const TextStyle(color: Colors.white38),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppTheme.flameOrange,
                ),
                filled: true,
                fillColor: AppTheme.darkSurface,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppTheme.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppTheme.flameOrange),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    selectedColor: AppTheme.salamanderGreen,
                    backgroundColor: AppTheme.darkSurface,
                    side: BorderSide(
                      color: isSelected ? AppTheme.gold : AppTheme.border,
                    ),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.white60,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredWeapons.length,
              itemBuilder: (context, index) {
                final weapon = filteredWeapons[index];
                return WeaponCard(
                  weapon: weapon,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(weapon: weapon),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

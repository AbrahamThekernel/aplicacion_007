import 'package:flutter/material.dart';

import '../models/weapon.dart';
import '../theme/app_theme.dart';

class DetailScreen extends StatelessWidget {
  final Weapon weapon;

  const DetailScreen({super.key, required this.weapon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weapon.name),
        backgroundColor: AppTheme.darkAppBar,
        foregroundColor: AppTheme.gold,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: weapon.name,
              child: Container(
                height: 220,
                width: double.infinity,
                color: AppTheme.darkGreen,
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  weapon.imageAsset,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.local_fire_department,
                      size: 70,
                      color: AppTheme.flameOrange,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: AppTheme.flameOrange,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          weapon.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.gold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    weapon.category,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.flameOrange,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _StatTile(
                          icon: Icons.bolt,
                          color: AppTheme.flameRed,
                          label: 'Daño',
                          value: '${weapon.damage}',
                        ),
                      ),
                      Expanded(
                        child: _StatTile(
                          icon: Icons.straighten,
                          color: AppTheme.salamanderGreen,
                          label: 'Alcance',
                          value: '${weapon.range}m',
                        ),
                      ),
                      Expanded(
                        child: _StatTile(
                          icon: Icons.warning_amber,
                          color: AppTheme.gold,
                          label: 'Letalidad',
                          value: weapon.lethality,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32, color: AppTheme.border),
                  const Text(
                    'Especificaciones Técnicas',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    weapon.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white60,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.salamanderGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: AppTheme.gold),
                        ),
                      ),
                      icon: const Icon(Icons.bookmark_add),
                      label: const Text(
                        'AÑADIR A RELIQUIAS FAVORITAS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppTheme.darkGreen,
                            content: Text(
                              '"${weapon.name}" consagrado en favoritos.',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _StatTile({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22, color: color),
        const SizedBox(height: 4),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.white54),
        ),
      ],
    );
  }
}

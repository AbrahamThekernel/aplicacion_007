import 'package:flutter/material.dart';

import '../models/weapon.dart';
import '../theme/app_theme.dart';

class WeaponCard extends StatelessWidget {
  final Weapon weapon;
  final VoidCallback onTap;

  const WeaponCard({
    super.key,
    required this.weapon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shadowColor: AppTheme.flameOrange.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppTheme.border),
        ),
        color: AppTheme.darkSurface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: weapon.name,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    weapon.imageAsset,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppTheme.darkGreen,
                      child: const Center(
                        child: Icon(
                          Icons.local_fire_department,
                          size: 44,
                          color: AppTheme.flameOrange,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weapon.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        size: 13,
                        color: AppTheme.flameOrange,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          weapon.category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppTheme.gold,
                          ),
                        ),
                      ),
                    ],
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

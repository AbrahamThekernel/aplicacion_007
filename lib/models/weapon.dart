class Weapon {
  final String name;
  final String category;
  final String description;
  final String imageAsset;
  final int damage;
  final int range;
  final String lethality;

  const Weapon({
    required this.name,
    required this.category,
    required this.description,
    required this.imageAsset,
    required this.damage,
    required this.range,
    required this.lethality,
  });
}

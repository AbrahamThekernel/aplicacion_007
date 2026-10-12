import '../models/weapon.dart';

final List<Weapon> dummyWeapons = [
  const Weapon(
    name: 'Bolter Pesado Modelo Godwyn',
    category: 'Rifles de Asalto',
    description:
        'Arma estándar de los Adeptus Astartes. Dispara proyectiles autopropulsados con ojivas explosivas capaces de diezmar infantería pesada.',
    imageAsset: 'assets/images/bolter.png',
    damage: 30,
    range: 30,
    lethality: 'Extrema',
  ),
  const Weapon(
    name: 'Espada Sierra Astartes',
    category: 'Cuerpo a Cuerpo',
    description:
        'Dientes de adamantium giratorios movidos por un motor hiper-denso que desgarran armaduras y carne con facilidad brutal.',
    imageAsset: 'assets/images/chainsword.png',
    damage: 90,
    range: 15,
    lethality: 'Alta',
  ),
  const Weapon(
    name: 'Rifle de Plasma de Custer',
    category: 'Energía',
    description:
        'Emplea núcleos de gas hidrógeno sobrecalentado contenidos por campos magnéticos. Su potencia es devastadora, con riesgo de sobrecarga.',
    imageAsset: 'assets/images/plasma.png',
    damage: 95,
    range: 80,
    lethality: 'Catastrófica',
  ),
  const Weapon(
    name: 'Pistola Bólter M36',
    category: 'Secundarias',
    description:
        'Versión compacta del bólter clásico, ideal para combates a corta distancia y oficiales de la Inquisición.',
    imageAsset: 'assets/images/boltpistol.png',
    damage: 60,
    range: 40,
    lethality: 'Moderada',
  ),
];

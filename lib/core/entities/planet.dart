class Planet {
  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String population;
  final String surfaceWater;

  Planet({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.population,
    required this.surfaceWater,
  });

  factory Planet.fromJson(json) => Planet(
        name: json['name'],
        rotationPeriod: json['rotation_period'],
        orbitalPeriod: json['orbital_period'],
        population: json['population'],
        surfaceWater: json['surface_water'],
      );
}

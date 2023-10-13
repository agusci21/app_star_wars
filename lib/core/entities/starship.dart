class Starship {
  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String starshipClass;
  Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.starshipClass,
  });

  factory Starship.fromJson(json) => Starship(
        name: json['name'],
        model: json['model'],
        manufacturer: json['manufacturer'],
        costInCredits: json['cost_in_credits'],
        starshipClass: json['starship_class'],
      );
}

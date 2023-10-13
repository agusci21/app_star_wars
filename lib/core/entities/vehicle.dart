
class Vehicle{
  final String name;
  final String manufacturer;
  final String costInCredits;
  final String vehicleClass;

  const Vehicle({
    required this.name,
    required this.manufacturer,
    required this.costInCredits,
    required this.vehicleClass,
  });

  factory Vehicle.fromJson(json) => Vehicle(
    name: json['name'],
    manufacturer: json['manufacturer'],
    costInCredits: json['cost_in_credits'],
    vehicleClass: json['vehicle_class'],
  );
}
class Heroe {
  final String name;
  final String fullName;
  final String gender;
  final String intelligence;
  final String imageUrl;

  Heroe({
    required this.name,
    required this.fullName,
    required this.gender,
    required this.intelligence,
    required this.imageUrl,
  });

  factory Heroe.fromJson(Map<String, dynamic> json) {
    return Heroe(
      name: json['name'] ?? 'Unknown Name',
      fullName: json['biography']['full-name'] ?? 'Unknown Name',
      gender: json['appearance']['gender'] ?? 'Unknown gender',
      intelligence: json['powerstats']['intelligence'] ?? 'Unknown intelligence',
      imageUrl: json['image']?['url'] ?? 'Unknown image',
    );
  }
}
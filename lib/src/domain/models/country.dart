class Country {
  Country({
    required this.name,
    required this.shortName,
    required this.phoneCode,
  });

  String name;
  String shortName;
  int phoneCode;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["country_name"],
      shortName: json["country_short_name"],
      phoneCode: json["country_phone_code"],
    );
  }
}

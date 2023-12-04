class Address {
  final String street;
  final String city;
  final String postcode;

  const Address(this.street, this.city, this.postcode);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};

    final String street = properties['name'];
    final String city = properties['city'];
    final String postcode = properties['postcode'];

    return Address(street, city, postcode);
  }

  @override
  String toString() {
    return '$street, $city, $postcode';
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'postcode': postcode,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(json['street'], json['city'], json['postcode']);
  }
}

class Expert {
  final String name;
  final String imageUrl;
  final List<String> specialties;
  final String address;
  final String workDescription;
  final String? phoneNumber;
  final String? email;

  Expert({
    required this.name,
    required this.imageUrl,
    required this.specialties,
    required this.address,
    required this.workDescription,
    this.phoneNumber,
    this.email,
  });

  // Create a copy of the expert with optional new values
  Expert copyWith({
    String? name,
    String? imageUrl,
    List<String>? specialties,
    String? address,
    String? workDescription,
    String? phoneNumber,
    String? email,
  }) {
    return Expert(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      specialties: specialties ?? this.specialties,
      address: address ?? this.address,
      workDescription: workDescription ?? this.workDescription,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  // Convert to JSON for potential API usage
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'specialties': specialties,
      'address': address,
      'workDescription': workDescription,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  // Create from JSON for potential API usage
  factory Expert.fromJson(Map<String, dynamic> json) {
    return Expert(
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      specialties: List<String>.from(json['specialties'] ?? []),
      address: json['address'] ?? '',
      workDescription: json['workDescription'] ?? '',
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }
}

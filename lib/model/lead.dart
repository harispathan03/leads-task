class Lead {
  String name;
  String email;
  String phone;
  String service;

  Lead({
    required this.name,
    required this.email,
    required this.phone,
    required this.service,
  });

  // JSON → Lead
  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      service: json['service'] ?? '',
    );
  }

  // Lead → JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'service': service,
    };
  }
}

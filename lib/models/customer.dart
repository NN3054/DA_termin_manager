class Customer {
  final int id;
  final String vorname;
  final String nachname;
  final String telefonnummer;
  final String email;

  Customer(
      {this.id, this.vorname, this.nachname, this.telefonnummer, this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vorname': vorname,
      'nachname': nachname,
      'telefonnummer': telefonnummer,
      'email': email,
    };
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int,
      vorname: json['forename'] as String,
      nachname: json['surname'] as String,
      email: json['email'] as String,
      telefonnummer: json['phonenumber'] as String,
    );
  }
}

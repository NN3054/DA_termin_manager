class Meeting {
  final int id;
  final String vorname;
  final String nachname;
  final String behandlungsart;

  Meeting({this.id, this.vorname, this.nachname, this.behandlungsart});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vorname': vorname,
      'nachname': nachname,
      'behandlungsart': behandlungsart,
    };
  }
}

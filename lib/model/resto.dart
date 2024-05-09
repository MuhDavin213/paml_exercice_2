// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Resto {
  int id;
  String rate_resto;
  String nama;
  String alamat;
  Resto({
    required this.id,
    required this.rate_resto,
    required this.nama,
    required this.alamat,
  });

  Resto copyWith({
    int? id,
    String? rate_resto,
    String? nama,
    String? alamat,
  }) {
    return Resto(
      id: id ?? this.id,
      rate_resto: rate_resto ?? this.rate_resto,
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rate_resto': rate_resto,
      'nama': nama,
      'alamat': alamat,
    };
  }

  factory Resto.fromMap(Map<String, dynamic> map) {
    return Resto(
      id: map['id'] as int,
      rate_resto: map['rate_resto'] as String,
      nama: map['nama'] as String,
      alamat: map['alamat'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Resto.fromJson(String source) =>
      Resto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Resto(id: $id, rate_resto: $rate_resto, nama: $nama, alamat: $alamat)';
  }

  @override
  bool operator ==(covariant Resto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.rate_resto == rate_resto &&
        other.nama == nama &&
        other.alamat == alamat;
  }

  @override
  int get hashCode {
    return id.hashCode ^ rate_resto.hashCode ^ nama.hashCode ^ alamat.hashCode;
  }
}

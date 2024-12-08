class JenisBarang {
  final int? id;
  final String namaJenisBarang;
  final String keterangan;

  JenisBarang({
    this.id,
    required this.namaJenisBarang,
    required this.keterangan,
  });

  factory JenisBarang.fromJson(Map<String, dynamic> json) {
    return JenisBarang(
      id: int.parse(json['id'].toString()),
      namaJenisBarang: json['nama_jenis_barang'],
      keterangan: json['keterangan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_jenis_barang': namaJenisBarang,
      'keterangan': keterangan,
    };
  }
}
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/jenis_barang_model.dart';

class JenisBarangController extends GetxController {
  var jenisBarangList = <JenisBarang>[].obs;
  var isLoading = false.obs;
  final String baseUrl = 'http://192.168.128.10/api';

  @override
  void onInit() {
    super.onInit();
    getJenisBarang();
  }

  Future<void> getJenisBarang() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('$baseUrl/get_jenis_barang.php'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        jenisBarangList.value = data.map((json) => JenisBarang.fromJson(json)).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addJenisBarang(String nama, String keterangan) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/add_jenis_barang.php'),
        body: json.encode({
          'nama_jenis_barang': nama,
          'keterangan': keterangan,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final data = json.decode(response.body);
      if (data['success']) {
        await getJenisBarang();
        Get.snackbar('Sukses', data['message']);
      } else {
        Get.snackbar('Error', data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambah data: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateJenisBarang(int id, String nama, String keterangan) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/update_jenis_barang.php'),
        body: json.encode({
          'id': id,
          'nama_jenis_barang': nama,
          'keterangan': keterangan,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final data = json.decode(response.body);
      if (data['success']) {
        await getJenisBarang();
        Get.snackbar('Sukses', data['message']);
      } else {
        Get.snackbar('Error', data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengupdate data: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteJenisBarang(int id) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/delete_jenis_barang.php'),
        body: json.encode({'id': id}),
        headers: {'Content-Type': 'application/json'},
      );

      final data = json.decode(response.body);
      if (data['success']) {
        await getJenisBarang();
        Get.snackbar('Sukses', data['message']);
      } else {
        Get.snackbar('Error', data['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus data: $e');
    } finally {
      isLoading(false);
    }
  }
}
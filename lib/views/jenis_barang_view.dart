import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/jenis_barang_controller.dart';

class JenisBarangView extends StatelessWidget {
  final controller = Get.put(JenisBarangController());
  final namaController = TextEditingController();
  final keteranganController = TextEditingController();

  void _showForm({int? id, String? nama, String? keterangan}) {
    namaController.text = nama ?? '';
    keteranganController.text = keterangan ?? '';

    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama Jenis Barang'),
              ),
              TextField(
                controller: keteranganController,
                decoration: InputDecoration(labelText: 'Keterangan'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (id != null) {
                    controller.updateJenisBarang(
                      id,
                      namaController.text,
                      keteranganController.text
                    );
                  } else {
                    controller.addJenisBarang(
                      namaController.text,
                      keteranganController.text
                    );
                  }
                  Get.back();
                },
                child: Text(id != null ? 'Update' : 'Tambah'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jenis Barang'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.jenisBarangList.length,
          itemBuilder: (context, index) {
            final item = controller.jenisBarangList[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(item.namaJenisBarang),
                subtitle: Text(item.keterangan),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showForm(
                        id: item.id,
                        nama: item.namaJenisBarang,
                        keterangan: item.keterangan,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: Text('Konfirmasi'),
                            content: Text('Yakin ingin menghapus data ini?'),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.deleteJenisBarang(item.id!);
                                  Get.back();
                                },
                                child: Text('Hapus'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ProfilePageWithAssets extends StatelessWidget {
  final String itemTitle;
  final String itemPrice;
  final String itemDescription;
  final String imagePath;
  final String itemCondition;
  final String itemYear;

  // Konstruktor untuk menerima data
  ProfilePageWithAssets({
    required this.itemTitle,
    required this.itemPrice,
    required this.itemDescription,
    required this.imagePath,
    required this.itemCondition,
    required this.itemYear,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),  // Menampilkan judul item
        backgroundColor: Colors.blueGrey,  // Warna AppBar biru keabu-abuan
        foregroundColor: Colors.white,  // Mengganti warna teks pada AppBar menjadi putih
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Menambahkan scroll jika konten terlalu panjang
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar item
              ClipRRect(
                borderRadius: BorderRadius.circular(12), // Membuat gambar dengan border rounded
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,  // Menyesuaikan gambar dengan lebar layar
                ),
              ),
              SizedBox(height: 20),

              // Menampilkan judul item
              Text(
                itemTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,  // Warna hitam untuk judul
                ),
              ),
              SizedBox(height: 10),

              // Menampilkan harga item
              Text(
                itemPrice,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,  // Warna hijau untuk harga
                ),
              ),
              SizedBox(height: 20),

              // Menampilkan deskripsi item
              Text(
                itemDescription,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,  // Warna teks lebih soft
                ),
              ),
              SizedBox(height: 20),

              // Menambahkan detail lelang
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],  // Latar belakang biru muda untuk detail
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2), // Shadow di bawah kotak
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menampilkan kondisi mobil
                    _buildDetailRow("Kondisi Mobil", itemCondition),
                    SizedBox(height: 12),
                    // Menampilkan tahun mobil
                    _buildDetailRow("Tahun Mobil", itemYear),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun row yang menampilkan detail lelang
  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,  // Warna teks judul detail
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,  // Warna teks value
          ),
        ),
      ],
    );
  }
}

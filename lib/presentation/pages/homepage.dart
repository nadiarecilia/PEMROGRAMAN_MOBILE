import 'package:flutter/material.dart';
import 'package:uts_pemmob/presentation/pages/profile_page_with_assets.dart'; 

class Auction {
  final String city;
  final String date;
  final String time;
  final String whatsappNumber; 
  final String title;
  final String price;
  final String description;
  final String imagePath;
  final String itemCondition; 
  final String itemYear; 

  Auction({
    required this.city,
    required this.date,
    required this.time,
    required this.whatsappNumber, 
    required this.title,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.itemCondition,  
    required this.itemYear, 
  });
}

class HomePage extends StatelessWidget {
  final List<Auction> auctions = [
    Auction(
      city: 'Jakarta Barat',
      date: '16 November 2024',
      time: '12:00',
      whatsappNumber: '081234567890', 
      title: 'MITSUBISHI COLT DIESEL HD 125 PS',
      price: 'Start Rp 210,000,000',
      description: 'Mitsubishi Colt Diesel, Solar, Efisien, Tangguh untuk medan berat.',
      imagePath: 'assets/images/diesel.jpeg',
      itemCondition: 'Kondisi Baik', 
      itemYear: '2021',
    ),
    Auction(
      city: 'Surabaya Barat',
      date: '20 November 2024',
      time: '14:00',
      whatsappNumber: '082345678901', 
      title: 'TOYOTA HILUX VIGO 2.5',
      price: 'Start Rp 180,000,000',
      description: 'Toyota Hilux Vigo, Diesel, Mesin tangguh, Siap untuk perjalanan jarak jauh.',
      imagePath: 'assets/images/hilux.jpeg', 
      itemCondition: 'Kondisi Baik',
      itemYear: '2020',
    ),
    Auction(
      city: 'Bandung Timur',
      date: '22 November 2024',
      time: '10:00',
      whatsappNumber: '083456789012', 
      title: 'HONDA CR-V 2.4',
      price: 'Start Rp 350,000,000',
      description: 'Honda CR-V, Petrol, Teknologi canggih, Interior premium.',
      imagePath: 'assets/images/crv.jpeg', 
      itemCondition: 'Kondisi Sangat Baik',
      itemYear: '2023',
    ),
    Auction(
      city: 'Medan Selatan',
      date: '25 November 2024',
      time: '16:00',
      whatsappNumber: '084567890123', 
      title: 'SUZUKI APV 1.5',
      price: 'Start Rp 150,000,000',
      description: 'Suzuki APV, Petrol, Mobil keluarga nyaman, Mesin irit bahan bakar.',
      imagePath: 'assets/images/apv.jpeg', 
      itemCondition: 'Kondisi Baik',
      itemYear: '2021',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Balai Lelang Mobil',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: auctions.length,
          itemBuilder: (context, index) {
            final auction = auctions[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: AuctionCard(auction: auction),
            );
          },
        ),
      ),
    );
  }
}

// Widget untuk menampilkan informasi lelang
class AuctionCard extends StatelessWidget {
  final Auction auction;

  AuctionCard({required this.auction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              auction.city,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'WhatsApp: ${auction.whatsappNumber}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              auction.date,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Text(
              auction.time,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),

            // Menampilkan kondisi dan tahun dalam kotak
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    auction.itemCondition,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    auction.itemYear,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Bagian deskripsi telah dihapus
            // ElevatedButton untuk melihat detail tetap ada
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePageWithAssets(
                      itemTitle: auction.title,
                      itemPrice: auction.price,
                      itemDescription: auction.description,
                      imagePath: auction.imagePath, 
                      itemCondition: auction.itemCondition, 
                      itemYear: auction.itemYear,
                    ),
                  ),
                );
              },
              child: Text('Lihat Detail'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB6E2D3),
                minimumSize: Size(double.infinity, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

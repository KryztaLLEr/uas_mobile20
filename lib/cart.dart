import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/ambilgambar.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/detailpesanan.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset("assets/icons/back.png"),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Color.fromARGB(255, 20, 63, 107),
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 84, 22, 144),
                Color.fromARGB(255, 255, 73, 73),
                Color.fromARGB(255, 255, 205, 56),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mainpage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("pesanan").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!.docs
                        .map(
                          (e) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                  () => DetailPesanan(
                                    id: e.id,
                                    namaBarang: e.get("nama_barang"),
                                    harga: e.get("harga"),
                                    gambar: e.get("gambar"),
                                    namaPemesan: e.get("nama_lengkap"),
                                    alamat: e.get("alamat"),
                                    metodeBayar: e.get("cara_bayar"),
                                    premium: e.get("premium"),
                                  ),
                                );
                              },
                              child: Container(
                                height: 72,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color.fromARGB(255, 84, 22, 144),
                                      Color.fromARGB(255, 255, 73, 73),
                                      Color.fromARGB(255, 255, 205, 56),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minWidth: 50,
                                          minHeight: 50,
                                          maxWidth: 50,
                                          maxHeight: 50,
                                        ),
                                        child: FutureBuilder(
                                          future: getImageDownloadURL(
                                              e.get("gambar")),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<String> snapshot) {
                                            if (snapshot.connectionState ==
                                                    ConnectionState.done &&
                                                snapshot.hasData) {
                                              return Image.network(
                                                snapshot.data!,
                                                fit: BoxFit.cover,
                                              );
                                            }
                                            return const CircularProgressIndicator();
                                          },
                                        ),
                                      ),
                                      title: Text(
                                        e.get("nama_barang"),
                                      ),
                                      subtitle: Text(e.get("nama_lengkap")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

                  // return GridView.count(
                  //   crossAxisCount: 2,
                  //   shrinkWrap: true,
                  //   children: snapshot.data!.docs
                  //       .map(
                  //         (e) => InkWell(
                  //           onTap: () {
                  //             Get.to(
                  //               () => DetailPesanan(
                  //                   id: e.id,
                  //                   namaBarang: e.get("nama_barang"),
                  //                   harga: e.get("harga"),
                  //                   gambar: e.get("gambar"),
                  //                   namaPemesan: e.get("nama_lengkap"),
                  //                   alamat: e.get("alamat"),
                  //                   metodeBayar: e.get("cara_bayar"),
                  //                   premium: e.get("premium")),
                  //             );
                  //           },
                  //           child: Container(
                  //             margin: const EdgeInsets.all(13),
                  //             padding: const EdgeInsets.all(13),
                  //             alignment: Alignment.bottomCenter,
                  //             decoration: BoxDecoration(
                  //               gradient: const LinearGradient(
                  //                 begin: Alignment.topCenter,
                  //                 end: Alignment.bottomCenter,
                  //                 colors: [
                  //                   Color.fromARGB(255, 84, 22, 144),
                  //                   Color.fromARGB(255, 255, 73, 73),
                  //                   Color.fromARGB(255, 255, 205, 56),
                  //                 ],
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.black.withOpacity(0.5),
                  //                   blurRadius: 10,
                  //                   offset: const Offset(5, 5),
                  //                 ),
                  //               ],
                  //             ),
                  //             child: Column(
                  //               children: [
                  //                 Expanded(
                  //                   child: AspectRatio(
                  //                     aspectRatio: 1 / 1,
                  //                     child: FutureBuilder(
                  //                       future: getImageDownloadURL(
                  //                           e.get("gambar")),
                  //                       builder: (BuildContext context,
                  //                           AsyncSnapshot<String> snapshot) {
                  //                         if (snapshot.connectionState ==
                  //                                 ConnectionState.done &&
                  //                             snapshot.hasData) {
                  //                           return Image.network(
                  //                             snapshot.data!,
                  //                             fit: BoxFit.cover,
                  //                           );
                  //                         }
                  //                         return const CircularProgressIndicator();
                  //                       },
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   e.get("nama_barang") +
                  //                       "\nRp. " +
                  //                       e.get("harga").toString(),
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(
                  //                     fontSize: 13,
                  //                     color: Color.fromARGB(255, 20, 63, 107),
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   e.get("nama_lengkap"),
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(
                  //                     fontSize: 13,
                  //                     color: Color.fromARGB(255, 20, 63, 107),
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //       .toList(),
                  // );
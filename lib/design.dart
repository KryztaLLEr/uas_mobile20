import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/ambilgambar.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/detailpage.dart';

class Design extends StatelessWidget {
  const Design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  FirebaseFirestore.instance.collection("laptop").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: snapshot.data!.docs
                        .where((e) => e.get("jenis") == "Design")
                        .map(
                          (e) => InkWell(
                            onTap: () {
                              Get.to(
                                () => DetailPage(
                                  id: e.id,
                                  nama: e.get("nama"),
                                  harga: e.get("harga"),
                                  stok: e.get("stok"),
                                  deskripsi: e.get("deskripsi"),
                                  gambar: e.get("gambar"),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(13),
                              padding: const EdgeInsets.all(13),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 84, 22, 144),
                                    Color.fromARGB(255, 255, 73, 73),
                                    Color.fromARGB(255, 255, 205, 56),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
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
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 1 / 1,
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
                                  ),
                                  Text(
                                    e.get("nama") +
                                        "\nRp. " +
                                        e.get("harga").toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 20, 63, 107),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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

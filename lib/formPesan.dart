import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/ambilgambar.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/formPesancontrol.dart';

class FormPesan extends StatelessWidget {
  const FormPesan({
    Key? key,
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
  }) : super(key: key);

  final String id;
  final String nama;
  final int harga;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    TextControl tc = Get.put(TextControl());
    CheckboxControl cc = Get.put(CheckboxControl());
    RadioControl rc = Get.put(RadioControl());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset("assets/icons/back.png"),
        ),
        title: const Text(
          "Formulir Pemesanan",
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
      body: PageView(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/mainpage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              child: ListView(
                children: [
                  FutureBuilder(
                    future: getImageDownloadURL(gambar),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Image.network(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    width: 350,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
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
                    child: Text(
                      nama + "\nRp. " + harga.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 600,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Form Pemesanan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: tc.ctrlNama,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Isi Nama Lengkap Anda",
                            labelText: "Nama Lengkap",
                          ),
                        ),
                        TextFormField(
                          maxLines: 3,
                          controller: tc.ctrlAlamat,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Isi Alamat Pengiriman Barang",
                            labelText: "Alamat",
                          ),
                        ),
                        ListTile(
                          title: const Text("Gopay"),
                          leading: Obx(
                            () => Radio(
                              groupValue: rc.payMethod.value,
                              value: "Gopay",
                              onChanged: (value) {
                                rc.onChangedMethod(value);
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text("Dana"),
                          leading: Obx(
                            () => Radio(
                              groupValue: rc.payMethod.value,
                              value: "Dana",
                              onChanged: (value) {
                                rc.onChangedMethod(value);
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text("Ovo"),
                          leading: Obx(
                            () => Radio(
                              groupValue: rc.payMethod.value,
                              value: "Ovo",
                              onChanged: (value) {
                                rc.onChangedMethod(value);
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title:
                              const Text("Layanan Premium (Rp15000/Transaksi"),
                          leading: Obx(
                            () => Checkbox(
                              value: cc.isPremium.value,
                              onChanged: cc.onPressed,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("pesanan")
                                .add({
                              "gambar": gambar,
                              "nama_barang": nama,
                              "harga": harga,
                              "nama_lengkap": tc.ctrlNama.text,
                              "alamat": tc.ctrlAlamat.text,
                              "cara_bayar": rc.payMethod.value,
                              "premium": cc.isPremium.value,
                            });
                            Get.back();
                            Get.back();
                            Get.snackbar(
                              "Barang Berhasil Dipesan",
                              "Informasi Lebih Lanjut Dapat Dilihat Di Menu Cart",
                              duration: const Duration(seconds: 2),
                              backgroundColor: Color.fromARGB(255, 84, 22, 144),
                              colorText: Color.fromARGB(255, 255, 205, 56),
                            );
                          },
                          child: const Text("Pesan"),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            primary: Color.fromARGB(255, 255, 205, 56),
                            onPrimary: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

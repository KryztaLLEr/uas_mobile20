import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/ambilgambar.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/formPesancontrol.dart';

class DetailPesanan extends StatelessWidget {
  const DetailPesanan({
    Key? key,
    required this.id,
    required this.namaBarang,
    required this.harga,
    required this.gambar,
    required this.namaPemesan,
    required this.alamat,
    required this.metodeBayar,
    required this.premium,
  }) : super(key: key);

  final String id;
  final String namaBarang;
  final int harga;
  final String gambar;
  final String namaPemesan;
  final String alamat;
  final String metodeBayar;
  final bool premium;

  @override
  Widget build(BuildContext context) {
    PageController swipe = PageController(initialPage: 0);
    TextControl tc = Get.put(TextControl());
    CheckboxControl cc = Get.put(CheckboxControl());
    RadioControl rc = Get.put(RadioControl());
    tc.ctrlNama.text = namaPemesan;
    tc.ctrlAlamat.text = alamat;
    tc.nama.value = namaPemesan;
    tc.alamat.value = alamat;
    rc.payMethod.value = metodeBayar;
    cc.isPremium.value = premium;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset("assets/icons/back.png"),
        ),
        title: const Text(
          "Detail Pemesanan",
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
        controller: swipe,
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
                    height: 50,
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
                      namaBarang + "\nRp. " + harga.toString(),
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
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.all(13),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Informasi Pemesanan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Nama : ${tc.nama.value}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Alamat : ${tc.alamat.value}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Pembayaran via : ${rc.payMethod.value}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cc.isPremium.value
                              ? "Status Premium : Ya"
                              : "Status Premium : Tidak",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            swipe.jumpToPage(1);
                          },
                          child: const Text("Perbarui"),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            primary: Color.fromARGB(255, 255, 205, 56),
                            onPrimary: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("pesanan")
                                .doc(id)
                                .delete();
                            Get.back();
                            Get.snackbar(
                              "Barang Berhasil Dihapus",
                              "Kembali Ke Menu Cart",
                              duration: const Duration(seconds: 2),
                              backgroundColor: Color.fromARGB(255, 84, 22, 144),
                              colorText: Color.fromARGB(255, 255, 205, 56),
                            );
                          },
                          child: const Text("Hapus"),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            primary: Color.fromARGB(255, 255, 56, 56),
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
          UpdatePemesanan(
            id: id,
            namaBarang: namaBarang,
            harga: harga,
            gambar: gambar,
            namaPemesan: namaPemesan,
            alamat: alamat,
            metodeBayar: metodeBayar,
            premium: premium,
          ),
        ],
      ),
    );
  }
}

class UpdatePemesanan extends StatelessWidget {
  const UpdatePemesanan({
    Key? key,
    required this.id,
    required this.namaBarang,
    required this.harga,
    required this.gambar,
    required this.namaPemesan,
    required this.alamat,
    required this.metodeBayar,
    required this.premium,
  }) : super(key: key);

  final String id;
  final String namaBarang;
  final int harga;
  final String gambar;
  final String namaPemesan;
  final String alamat;
  final String metodeBayar;
  final bool premium;

  @override
  Widget build(BuildContext context) {
    TextControl tc = Get.put(TextControl());
    CheckboxControl cc = Get.put(CheckboxControl());
    RadioControl rc = Get.put(RadioControl());
    return Container(
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Update Pemesanan",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: tc.ctrlNama,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Isi Nama Lengkap Anda",
              labelText: "Nama Lengkap",
            ),
          ),
          const SizedBox(
            height: 20,
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
          const SizedBox(
            height: 20,
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
            title: const Text("Layanan Premium (Rp15000/Transaksi"),
            leading: Obx(
              () => Checkbox(
                value: cc.isPremium.value,
                onChanged: cc.onPressed,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection("pesanan").doc(id).update({
                "gambar": gambar,
                "nama_barang": namaBarang,
                "harga": harga,
                "nama_lengkap": tc.ctrlNama.text,
                "alamat": tc.ctrlAlamat.text,
                "cara_bayar": rc.payMethod.value,
                "premium": cc.isPremium.value,
              });
              Get.back();
              Get.snackbar(
                "Informasi Pemesanan Berhasil Diubah",
                "Kembali Ke Menu Cart",
                duration: const Duration(seconds: 2),
                backgroundColor: Color.fromARGB(255, 84, 22, 144),
                colorText: Color.fromARGB(255, 255, 205, 56),
              );
            },
            child: const Text("Perbarui"),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/cart.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/semua.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/gaming.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/office.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/design.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/formPesan.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/search.png"),
          ),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  prefix: const Padding(
                    padding: EdgeInsets.only(right: 20),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const Cart());
              },
              icon: Image.asset("assets/icons/cart.png"),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 84, 22, 144),
                  Color.fromARGB(255, 255, 73, 73),
                  Color.fromARGB(255, 255, 205, 56),
                ],
              ),
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Color.fromARGB(255, 20, 63, 107),
            tabs: [
              Tab(text: "Semua"),
              Tab(text: "Gaming"),
              Tab(text: "Office"),
              Tab(text: "Design"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Semua(),
            Gaming(),
            Office(),
            Design(),
          ],
        ),
      ),
    );
  }
}

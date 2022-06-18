import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/splashcontroller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashControl sc = Get.put(SplashControl());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mainpage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: const Text(
                "v1rzt Laptop",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 20, 63, 107),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/Logo.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(80),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: const Text(
                "By\nJorghi Inzaghi Tanson",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 20, 63, 107),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

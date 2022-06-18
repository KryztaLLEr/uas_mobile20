import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mainpage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

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
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: const Text(
                "Selamat Datang\ndi\nv1rzt Laptop",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 20, 63, 107),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
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
                        child: Image.asset(
                          "assets/images/gaming_1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text("Asus ROG Zephyrus Duo 15"),
                      subtitle: const Text("Rp. 60.500.000"),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
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
                        child: Image.asset(
                          "assets/images/office_1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text("Asus Vivobook Pro 14X"),
                      subtitle: const Text("Rp. 19.999.000"),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
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
                        child: Image.asset(
                          "assets/images/designer_2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text("Apple Macbook Pro 16-inch"),
                      subtitle: const Text("Rp. 36.000.000"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: const Text(
                "Nikmati Berbelanja Laptop Secara Online\nSe-kota Samarinda",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 20, 63, 107),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                Get.off(const MainPage());
              },
              child: const Text(
                "Lanjut",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 20, 63, 107),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//              SingleChildScrollView(
//                 physics: const PageScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 300,
//                       width: 400,
//                       alignment: Alignment.bottomCenter,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                             "assets/images/gaming_1.png",
//                           ),
//                         ),
//                       ),
//                       child: const Text(
//                         "Asus Zephyrus Duo 15",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Color.fromARGB(255, 20, 63, 107),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 300,
//                       width: 400,
//                       alignment: Alignment.bottomCenter,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                             "assets/images/office_1.png",
//                           ),
//                         ),
//                       ),
//                       child: const Text(
//                         "Asus Vivobook Pro 14X",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Color.fromARGB(255, 20, 63, 107),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 300,
//                       width: 400,
//                       alignment: Alignment.bottomCenter,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                             "assets/images/designer_2.png",
//                           ),
//                         ),
//                       ),
//                       child: const Text(
//                         "Apple Macbook Pro 16-inch",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Color.fromARGB(255, 20, 63, 107),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
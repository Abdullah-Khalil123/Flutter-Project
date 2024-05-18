import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first/DetailedCard.dart';
import 'package:first/sidenav.dart';
import 'package:flutter/material.dart';

class ResturantInfo {
  String name;
  int reviews;
  double rating;

  ResturantInfo(
      {required this.name, required this.reviews, required this.rating});
}

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var categories = <Map<String, String>>[
    {
      'name': 'Burger',
      'icon': 'icons/burger.png',
    },
    {
      'name': 'Donut',
      'icon': 'icons/donut.png',
    },
    {
      'name': 'Pizza',
      'icon': 'icons/pizza.png',
    },
    {
      'name': 'Mexican',
      'icon': 'icons/mexican.png',
    },
    {
      'name': 'Asian',
      'icon': 'icons/asian.png',
    },
  ];

  List<ResturantInfo> resturants = [
    ResturantInfo(name: "McDonalds", reviews: 25, rating: 4.5),
    ResturantInfo(name: "KFC", reviews: 95, rating: 9.5),
    ResturantInfo(name: "SubWay", reviews: 15, rating: 6.5),
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const SideNav(),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.person_2,
                size: 40,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                "What Would You like to order",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const SearchBar(
                hintText: "Search",
                leading: Icon(Icons.search),
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(46, 158, 158, 158),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(right: 40),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int index = 0; index < categories.length; index++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 100,
                        width: 65,
                        decoration: BoxDecoration(
                          color: selectedCategoryIndex == index
                              ? const Color.fromRGBO(254, 114, 76, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 6, bottom: 5),
                              height: 50,
                              padding: const EdgeInsets.all(8),
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Image(
                                  image: AssetImage(
                                      categories[index]['icon'] ?? '')),
                            ),
                            Text(
                              categories[index]['name'] ?? '',
                              style: TextStyle(
                                color: selectedCategoryIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 35,
                        child: Text(
                          "Featured Resturants",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: const Text(
                            "View All >",
                            style: TextStyle(
                              color: Color.fromRGBO(254, 114, 76, 1),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...resturants
                    .map((e) => DetailedCard(
                          name: e.name,
                          rating: e.rating,
                          reviews: e.reviews,
                          key: Key(e.name),
                        ))
                    .toList()
              ]),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: const Color.fromRGBO(254, 114, 76, 1),
          backgroundColor: Colors.white,
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.mail,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

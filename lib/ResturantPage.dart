import 'package:first/MenuBox.dart';
import 'package:flutter/material.dart';

class ResturantPage extends StatefulWidget {
  ResturantPage({super.key});

  @override
  State<ResturantPage> createState() => _ResturantPageState();
}

class _ResturantPageState extends State<ResturantPage> {
  int cartitems = 0;

  var menuItems = <Map<String, dynamic>>[
    {
      'name': 'Crispy Box',
      'discription':
          '2 Pieces hot and crisp chiken,regular friesmcoleslaw and regular drink',
      'price': 650,
    },
    {
      'name': 'Crispy Box',
      'discription':
          '2 Pieces hot and crisp chiken,regular friesmcoleslaw and regular drink',
      'price': 650,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 300,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage('images/mcdonalds.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        IconButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          icon: Icon(Icons.heart_broken),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MenuBox(menuItems: menuItems),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

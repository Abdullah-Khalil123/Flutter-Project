import 'package:first/ResturantPage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailedCard extends StatelessWidget {
  final String name;
  int reviews;
  double rating;
  DetailedCard(
      {super.key,
      required this.name,
      required this.rating,
      required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResturantPage()));
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: 270,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('images/mcdonalds.jpg'),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 80,
                      padding: const EdgeInsets.only(left: 3),
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            reviews.toString(),
                            style: const TextStyle(fontSize: 14),
                          ),
                          const Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: Color.fromARGB(255, 213, 175, 85),
                          ),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(254, 114, 76, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.heart_broken,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 18,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.pedal_bike_sharp,
                          color: Color.fromRGBO(254, 114, 76, 1),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Free Delivery"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.timer,
                          color: Color.fromRGBO(254, 114, 76, 1),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("10-15 min"),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Row(
                      children: [
                        Text('Burger'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Chicken'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Fast Food'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

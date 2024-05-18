import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuBox extends StatefulWidget {
  final menuItems;
  MenuBox({super.key, required this.menuItems});

  int totalitem = 0;

  @override
  State<MenuBox> createState() => _MenuBoxState();
}

class _MenuBoxState extends State<MenuBox> {
  void handleButton(int val) {
    if (val == 1) {
      setState(() {
        widget.totalitem++;
      });
    } else if (val == 0) {
      setState(() {
        widget.totalitem--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              "Category Title",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...widget.menuItems
              .map((menuItem) => Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, top: 10, right: 25),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(196, 194, 194, 1)))),
                    child: InkWell(
                      onTap: () {
                        print(widget.totalitem);
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            width: double.infinity,
                            height: 900,
                            child: BottomSheet(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menuItem['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                width: 250,
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  menuItem['discription'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                              ),
                              Text('from Rs. ${menuItem['price']}.00'),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black,
                            )),
                            child: const Text("IMAGE"),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  int totalitem = 1;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Image(
          image: AssetImage('images/mcdonalds.jpg'),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Item Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                'Rs. 123.00',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        _frequentlyBoughtTogether(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        totalitem++;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                  Text(totalitem.toString()),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (totalitem >= 1) {
                          totalitem--;
                        } else {
                          totalitem = 0;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                ],
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: const Text(
                    'Add to Cart',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Container _frequentlyBoughtTogether() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Frequently Bought Together'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: const Text(
                  "Optional",
                  style: TextStyle(),
                ),
              ),
            ],
          ),
          const Text(
            'Other Custumers Also Ordered These',
            style: TextStyle(color: Colors.grey),
          ),
          BottomSheetItemToAdd(),
          BottomSheetItemToAdd(),
          BottomSheetItemToAdd()
        ],
      ),
    );

Row BottomSheetItemToAdd() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Checkbox(
            value: true,
            fillColor:
                MaterialStatePropertyAll(Color.fromRGBO(255, 167, 38, 1)),
            onChanged: null,
            side: BorderSide(color: Color.fromRGBO(255, 167, 38, 1)),
          ),
          Text('Pepsi'),
        ],
      ),
      Text('+ Rs. 400.00'),
    ],
  );
}

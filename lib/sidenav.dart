import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    List navlistitems = ['Profile', 'Vouchers', 'Referals', 'Random Bullshit'];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Abdullah'),
            accountEmail: const Text('abdullah@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/mcdonalds.jpg'),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(254, 114, 76, 1),
            ),
          ),
          ...navlistitems
              .map(
                (navitem) => ListTile(
                  leading: Icon(Icons.person),
                  title: Text(navitem),
                  onTap: () {},
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

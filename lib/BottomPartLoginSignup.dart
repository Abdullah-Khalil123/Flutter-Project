import 'package:flutter/material.dart';

class BottomPartLoginSignup extends StatelessWidget {
  final String buttontext;
  const BottomPartLoginSignup({super.key, required this.buttontext});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 2,
                width: 100,
                color: Colors.grey,
              ),
              const Text("Sign up with"),
              Container(
                height: 2,
                width: 100,
                color: Colors.grey,
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll<double>(0),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(Icons.g_mobiledata),
                    Text(
                      '  Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            ElevatedButton(
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll<double>(0),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(Icons.facebook),
                    Text(
                      '  FaceBook',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}

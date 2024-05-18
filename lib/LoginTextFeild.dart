import 'package:flutter/material.dart';

class TextFeildLogin extends StatelessWidget {
  final String datainput;
  final TextEditingController inputController;
  TextFeildLogin(
      {Key? key, required this.datainput, required this.inputController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          datainput,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: inputController,
          style: TextStyle(height: 1.2),
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
      ],
    );
  }
}

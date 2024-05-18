import 'package:first/BottomPartLoginSignup.dart';
import 'package:first/Services/Api.dart';
import 'package:flutter/material.dart';
import './LoginTextFeild.dart';
import './Login.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  Signup({super.key});

  List<String> loginText = ["Email", "Name", "Password"];
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/top.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: const Text("Sign up",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            TextFeildLogin(
              datainput: loginText[0],
              inputController: emailController,
            ),
            TextFeildLogin(
              datainput: loginText[1],
              inputController: nameController,
            ),
            TextFeildLogin(
              datainput: loginText[2],
              inputController: passwordController,
            ),
          ]),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: ElevatedButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(300, 56),
              backgroundColor: const Color(0xFFFE724C),
            ),
            onPressed: () async {
              var data = {
                'name': nameController.text,
                'email': emailController.text,
                'password': passwordController.text
              };

              if (data['name'] != '' &&
                  data['email'] != '' &&
                  data['password'] != '') {
                bool signInSuccess = false;
                signInSuccess = await Api.addSignUp(data);

                if (signInSuccess) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }
              }
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already Have an Account?  "),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.orange),
                ),
              )
            ],
          ),
        ),
        const Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
        )),
        const BottomPartLoginSignup(
          buttontext: "Sign up",
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

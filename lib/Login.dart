import 'package:first/Services/Api.dart';
import 'package:flutter/material.dart';
import './LoginTextFeild.dart';
import 'BottomPartLoginSignup.dart';
import 'MainPage.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  List<String> loginText = ["Email", "Password"];

  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/top.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Login In",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  TextFeildLogin(
                      datainput: loginText[0],
                      inputController: loginController),
                  TextFeildLogin(
                      datainput: loginText[1],
                      inputController: passwordController),
                ],
              ),
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
                    'email': loginController.text,
                    'password': passwordController.text
                  };
                  try {
                    bool loginSuccess = false;
                    loginSuccess = await Api.Login(data);

                    if (loginSuccess) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    }
                  } catch (e) {
                    print("Error On Login : ${e}");
                  }
                },
                child: const Text(
                  "Log In",
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
                  const Text("Don't have an Account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
            )),
            const BottomPartLoginSignup(
              buttontext: "Log In",
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:app/screen/signup_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:app/viewmodels/login_viewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'SecurityPin/pin_screen.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController EmailtextController = TextEditingController();
  TextEditingController PasswordtextController = TextEditingController();

   signin(BuildContext context)async{
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: EmailtextController.text,
    password: PasswordtextController.text

  );
    Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  Pin_screen()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Login",
                        style: TextStyle(
                            color: AppColors.color7,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Username/Email",
                        style: TextStyle(color: AppColors.color14),
                      ),
                      TextField(
                        obscureText: false,
                        controller: EmailtextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Username",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          fillColor: AppColors.color2,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(color: AppColors.color14),
                      ),
                      TextField(
                        obscureText: true,
                        controller: PasswordtextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          fillColor: AppColors.color2,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColors.color5)),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(color: AppColors.color1),
                          ),
                          onPressed: () {
                          signin(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                     const Center(
                        child: Text(
                          "OR",
                          style: TextStyle(
                           fontSize: 22,
                           fontWeight: FontWeight.w600,
                          ),
                          )
                        ),
                        const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColors.color5)),
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(color: AppColors.color1),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                                MaterialPageRoute(
                                  builder: (context) => signup_screen()
                                  ),
                            );
                          },
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}

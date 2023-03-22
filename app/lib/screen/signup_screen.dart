import 'package:app/screen/Login_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:app/viewmodels/signup_viewMOdel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'SecurityPin/pin_screen.dart';

  class signup_screen extends StatelessWidget {
   signup_screen({super.key});

  TextEditingController EmailtextController =TextEditingController();
 TextEditingController PasswordtextController =TextEditingController();

    signup(BuildContext context) async{
  try{
  final Credential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:EmailtextController.text,
     password: PasswordtextController.text);
   Navigator.pushReplacement(
          context,
           MaterialPageRoute(builder: (context) => Pin_screen())
          );

  }on FirebaseAuthException catch(e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
  }
  catch (e) {
  print(e);
  }
  }
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: ()=> SignupViewModel(),
      builder: (context , viewModel , child){
       return Scaffold(
          appBar: AppBar(
            // centerTitle: true,
            backgroundColor: AppColors.color8,
            leading: IconButton(
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=> Login()
                  )
                  );
              },
             icon: const Icon(Icons.arrow_back,color: AppColors.color7,),
             ),
          ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(       
            child: Column(   
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
               const SizedBox(height: 30,),
                const Text(
                    "Sign Up",
                  style: TextStyle(
                  color: AppColors.color7,
                   fontSize: 25,
                   fontWeight: FontWeight.w800
                  ), 
                  ),
                    const SizedBox(height: 40,),
                    const Text(
                       "Username/Email",
                       style: TextStyle(
                        color: AppColors.color14
                       ),
                            ),
                   TextField(
                            obscureText: false,
                           controller: EmailtextController,
                          decoration: const InputDecoration(
                               border : OutlineInputBorder(),
                            hintText: "Enter Username",
                            prefixIcon: Icon(
                              Icons.lock ,
                              color: Colors.black,
                              ),
                            fillColor: AppColors.color2,
                            filled: true,
                         ),
                          ),
                          const SizedBox(height: 40,),
                          const Text(
                            "Password",
                       style: TextStyle(
                        color: AppColors.color14
                       ),
                            ),
                         TextField(
                            obscureText: true,
                           controller: PasswordtextController,
                          decoration: const InputDecoration(
                               border : OutlineInputBorder(),
                            hintText: 'Enter Password',
                            prefixIcon: Icon(
                              Icons.lock ,
                              color: Colors.black,
                              ),
                            fillColor: AppColors.color2,
                            filled: true,
                         ),
                          ),
                       const SizedBox(height: 30,),
                        Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                     backgroundColor: MaterialStatePropertyAll(AppColors.color5)
                    ),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: AppColors.color1
                          ),
                          ),
                        onPressed: (){
                          signup(context);
                        },
                        ),
                     ),
                      const SizedBox(height: 10,),
              ]
            ),
        ),
      ),
    ); 
     }
      );
  }
}
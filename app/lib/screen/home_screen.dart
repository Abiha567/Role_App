import 'package:app/screen/Home_drawer_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:app/viewmodels/home_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'Order_tracking_screen.dart';

class Home_screen extends StatelessWidget {
   Home_screen({super.key});

  late String Context;  

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: ()=> HomeViewModel(),
      builder: (context,viewModel,child){
         return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=> MyDrawer()
                  )
                  );
              },
             icon: const Icon(Icons.menu)),
          ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img1.jpg"),
            fit: BoxFit.cover
          )
        ),  
         child:  Padding(
           padding:  EdgeInsets.only(top: 170),
           child: Column(
              children: [
                   Buttons("${viewModel.title}", context),
                   const SizedBox(height: 30,),
                   Buttons("${viewModel.title1}", context),
                   const SizedBox(height: 30,),
                   Buttons("${viewModel.title2}", context),
                   const SizedBox(height: 30,),
              ],
            ),
         ),
      ),
    ); 
      }
      );
   }

  Widget Buttons(String Text1 , BuildContext context) {
   return Container(
    width: 150,
    height: 40,
     child: ElevatedButton(
      onPressed: (){
           Navigator.push(
          context , 
          MaterialPageRoute(builder: (context)=> Order_tracking())
                        );
      }, 
      child: Text("$Text1"),
      style: const ButtonStyle(
         backgroundColor: MaterialStatePropertyAll(AppColors.color17)
        ),
      ),
   );
  }


}
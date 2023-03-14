import 'package:app/screen/home_screen.dart';
import 'package:app/viewmodels/calling_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCall_screen extends StatelessWidget {
  const PhoneCall_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: ()=> CallViewModel(),
      builder: (context, viewModel, child) {
        // return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //       onPressed: (){
        //         launch("tel:+91 888888");
        //       },
        //      child: const Text("Send Location")
        //     ),
            //  ElevatedButton(
            //   onPressed: (){},
            //  child: const Text("Call")
            // ),
        //   ],
        // );
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Home_screen())
                  );
              },
               icon: const Icon(Icons.arrow_back)),
          ),
          body: Center(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Row(
              children: [
               const Icon(Icons.call,size: 36,color: Colors.blue,),
               const SizedBox(width: 8,),
              const  SelectableText(
                  "+92 888888888",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  ElevatedButton(
                onPressed: ()async{
                 final Uri url = Uri(
                  scheme: "tel",
                  path: "+92 888888888"
                 );
                 if (await canLaunchUrl(url)) {
                   await launchUrl(url);
                 } 
                 else {
                   print("can not launch this url");
                 }
                },
               child: const Text("Call")
              ),
              ],
            )
            ],
                  ),
          ),
        );
      },
    );
  }
}
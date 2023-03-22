import 'package:app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'PinNum_screen.dart';

class SecurityPin_screen extends StatelessWidget {
   SecurityPin_screen({super.key});

  List<String> currentpin = ["","",""];
   int pinIndex = 0;
    //  var selectedindex = 0;

  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
   child: Column(
    children: <Widget> [
      Expanded(
        child: Container(
          alignment: const Alignment(0,0.5),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20.0,),
             const Text(
             "Security Pin",
             style: TextStyle(
             color: Colors.white70,
             fontSize: 21.0,
            fontWeight: FontWeight.w600,
               ),
           ),
            const SizedBox(height: 50.0,),
            buildPinRow(),
            const SizedBox(height: 20.0,),
            buildNumPad(context),
            ],
          ),
        ),
         ),
        //  buildNumPad(context),
    ],
   ),
    );
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
         PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController : pinTwoController
         ),
         PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController : pinThreeController
         ),
         PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController : pinFourController
         ),
      ],
    );
  }

 buildNumPad(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 60.0,
              child: const MaterialButton(
                onPressed: null,
                child: SizedBox(),
                ),
            ),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyBoardNumber(n: 1, onPressed: (){ pinIndexSetup("1");}),
              KeyBoardNumber(n: 2, onPressed: (){ pinIndexSetup("2");}),
              KeyBoardNumber(n: 3, onPressed: (){ pinIndexSetup("3");}),
            ],
           ),
           const SizedBox(height: 10,),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyBoardNumber(n: 4, onPressed: (){pinIndexSetup("4");}),
              KeyBoardNumber(n: 5, onPressed: (){pinIndexSetup("5");}),
              KeyBoardNumber(n: 6, onPressed: (){pinIndexSetup("6");}),
            ],
           ),
           const SizedBox(height: 10,),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyBoardNumber(n: 7, onPressed: (){pinIndexSetup("7");}),
              KeyBoardNumber(n: 8, onPressed: (){pinIndexSetup("8");}),
              KeyBoardNumber(n: 9, onPressed: (){pinIndexSetup("9");}),
            ],
           ),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Container(
                  width: 60.0,
                  child: MaterialButton(
                    onPressed: (){clearPin();},
                    height: 60.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: const Icon(Icons.cancel_presentation_rounded, color: Colors.white,)
                    ),
            ),
            KeyBoardNumber(n: 0, onPressed: (){pinIndexSetup("0");}),
             Container(
                  width: 60.0,
                  child: MaterialButton(
                    onPressed: (){
                       Navigator.push(
                            context, MaterialPageRoute(builder: (context)=> Home_screen()
                            ),
                            );
                    },
                    height: 60.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: const Icon(Icons.done, color: Colors.white,)
                    ),
            ),
            ],
           ),
          ],
        ),
      ),
       );
  }

  clearPin(){
    if (pinIndex==0) {
      pinIndex=0;
    }
    else if(pinIndex == 4) {
     setPin(pinIndex as int, "");
     currentpin[pinIndex-1] ="";
     pinIndex--;
      }
    else{
      setPin(pinIndex, "");
      currentpin[pinIndex-1] = "";
      pinIndex--;
    }
    }
  

pinIndexSetup(String Text){
   if (pinIndex == 0){
      pinIndex = 1;
   }
   else if(pinIndex < 4){
    pinIndex++;
    setPin(pinIndex,Text);
   }
   else {
     currentpin [pinIndex-1] = Text;
     String strPin = ""; 
     currentpin.forEach((e){
      strPin += e;
     });
   
   if (pinIndex == 4)
    print(strPin);
   }
}

 setPin(int n, String text) {
  switch (n) {
    case 1:
      pinOneController.text = text ;
      break;
    case 2:
      pinTwoController.text = text;
      break;
     case 3:
      pinThreeController.text = text;
      break;
     case 4:
      pinFourController.text = text;
      break;
  }
 }
} 
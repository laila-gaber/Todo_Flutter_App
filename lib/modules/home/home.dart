import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  //method
  @override
  Widget build(BuildContext context)
  {
 
    //method scafold to design every single screen
    return Scaffold(
      //parameter -->small letter/ object-->capital with ()

      appBar: AppBar(
        backgroundColor:Colors.teal,
        centerTitle:true ,
        //u are now in AppBar constructor
        //the parameters takes a widget like icon or Text
        leading: Icon(
          //menu is italic font then it is a static variable
          Icons.menu,
        ),
        title: Text(
            'First app'
        ),

      actions: [
          //Icons are objects from static class Icon that have const constructor has a  parameter and other parameters iss choosen ..
        IconButton(
            icon:  Icon(
                Icons.notification_important
            ),
            onPressed:my_fun,
        ),
           IconButton(
           icon: Text("hello"),
           onPressed: (){print("loz");}
           ),     //it takes any widget not only icons like text or image
         ]
      ),

      body:Column(
        children:
        [
          Container(
            color: Colors.red,
            width: 410,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(20.0,),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children:
                  [
                    Image(
                      image:NetworkImage(
                        "https://th.bing.com/th/id/R.9a5a2b2a16d3a63a3cbc389e559b7977?rik=1mGQ8fcSB1wDNg&riu=http%3a%2f%2f3.bp.blogspot.com%2f-yQwvUxecONM%2fT7JS63jG6NI%2fAAAAAAAAA3s%2fH_TPoUR84b0%2fw1200-h630-p-k-no-nu%2fcool%2bcat%2bpictures%2b1.jpg&ehk=nJg4r0gjtFhAaYIMXsUqkhi4hQB%2fEtEVsvztsG47S6Y%3d&risl=&pid=ImgRaw&r=0",

                      ) ,
                      height: 350.0,
                    width: 450.0,
                    fit: BoxFit.contain,
                  ),
                    Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Text(
                        "hi ya bro!",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ),
        ]


      ),
      );

  }

  void my_fun()
  {
    print("eshta3let ya ro7y!");
  }
}

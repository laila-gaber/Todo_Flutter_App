import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laila_flutter/shared/cubitt/cubit.dart';

Widget defaultbutton({
  double width=double.infinity,
  Color background=Colors.blue,
  bool isuppercase=true,
  @required Function function,
  @required String text,

})=>
    Container(
      width: width,

      height: 45,
      child: MaterialButton(
        onPressed:(){
         function;
        },
        child: Text(
          isuppercase?text.toUpperCase():text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),

        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
      ),
);

Widget defaultformfield({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onsubmit,
  Function onchanged,
  Function onTap,
  @required Function validate,
  @required String labeltext,
  @required IconData prefix,
  IconButton sufixbutton,
  Function sufixfunction,
  bool textsecure=false,
})=>
  TextFormField(
    controller:controller,
    keyboardType: type,
    obscureText: textsecure,
    onFieldSubmitted: onsubmit,//when click on the check mark in keyboard
    onChanged:onchanged ,
    onTap: onTap,
    decoration:InputDecoration(
    labelText:labeltext,
    border: OutlineInputBorder(),
    prefixIcon:
    Icon(
       prefix
    ),
    suffixIcon: sufixbutton,

    ),
    validator:validate,



  );

Widget BuildTaskItem(Map model)=>
  Container(
    //add the background color
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 35.0,
          child: Text(
            '${model['time']}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Column(

            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text('${model['title']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,

                ),
              ),
              Text('${model['date']}',
                style: TextStyle(

                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20,),
        //Done
        IconButton(
            icon: Icon(Icons.check_box_rounded,
              color: Colors.green,
              size: 30,
            ),
            onPressed: ()
            {

            }),
       //Archived
        IconButton(
            icon: Icon(Icons.archive,
              color: Colors.black54,
              size: 30,

            ),
            onPressed: ()
            {

            }),

      ],
    ),
),
  );
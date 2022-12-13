
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laila_flutter/shared/components/components.dart';
//ctrl+shift+- to close all widgets
//ctrl+shift+ + to open all widgets
class LoginScreen extends StatefulWidget
{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var Emailcontroller=TextEditingController();

  var Passwordcontroller=TextEditingController();

  var formkey =GlobalKey<FormState>();

  bool ispass=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child:Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login ',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defaultformfield(
                      controller:Emailcontroller,
                      type: TextInputType.emailAddress,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                          {
                            return 'Email must not be empty';
                          }
                        return null;
                      },
                      labeltext: 'Email ',
                      prefix: Icons.email,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  defaultformfield(
                    controller:Passwordcontroller,
                    type: TextInputType.number,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    labeltext: 'Pass',
                    prefix: Icons.lock,
                    textsecure: ispass,
                    sufixbutton: IconButton(
                        icon:ispass? Icon(Icons.visibility):Icon(Icons.visibility_off),
                      onPressed: ()
                      {
                            setState(()
                            {
                              ispass=!ispass;
                            });
                      },

                  ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultbutton(
                      text: 'login',
                    function: ()
                      {
                        if(formkey.currentState.validate())
                        {
                          print(Emailcontroller.text);
                          print(Passwordcontroller.text);
                        }
                      },
                    background: Colors.pinkAccent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?'
                      ),
                      TextButton(onPressed: (){},
                          child: Text(
                            'Register Now!'
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

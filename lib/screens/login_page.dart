import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:route_it/screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email="";
  String pw="";
  TextEditingController emailController=TextEditingController();
  TextEditingController pwController=TextEditingController();
  Future<void> createUser() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "$email",
          password: "$pw"
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: "$email",
    //       password: "$pw"
    //   );
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // } catch (e) {
    //   print(e);
    // }



    // try{
    //   UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
    // } on FirebaseAuthException catch(e){
    //   print('error');
    // }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
          //shadowColor: Colors.transparent,
        //automaticallyImplyLeading: false,
        title: Center(child: Text('RouteIt')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/map.png',scale: 2.3,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              controller: emailController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Email ID",
                //errorText: _validateEmail?"Enter valid username":null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pwController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                //errorText: _validateEmail?"Enter valid username":null,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        email=emailController.text;
                        pw=pwController.text;
                      });
                      createUser();
                      print('hello');
                    },
                    child: Text('Login'),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: (){
                      //createUser();
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                      print('Sign UP');
                    },
                    child: Text('Sign Up'),
                  )
              ),

            ],
          )

        ],

      ),
    );
  }
}

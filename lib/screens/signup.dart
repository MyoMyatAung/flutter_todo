import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/login.dart';
import 'package:flutter_todo/services/auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void displayDialog(BuildContext context, String title, String text){
    showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text(title),
        content: Text(text),
      );
    },);
  }



  void submit(BuildContext context, String username, String password) async{

    if(username.length < 4){
      displayDialog(context, "Invalid Username", "The username should be at least 5 characters");
    }else if(password.length < 4){
      displayDialog(context, "Weak password", "The password length should be at least 5 characters");
    }else{
      var res = await Provider.of<AuthProvider>(context, listen: false).attemptSignUp(username, password);
      if(res == 201){
        displayDialog(context, "Success", "The user was created. Login now");
      }else if(res == 409){
        displayDialog(context, "Signup Fail", "This user is already registered");
      }else{
        displayDialog(context, "Error", "Unknown Error occured");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 140,
            ),
            Stack(
              children: [
                Positioned(
                  left: 20.0,
                  top: 15.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0)),
                    width: 70.0,
                    height: 20.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 8.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Username",
                  hasFloatingPlaceholder: true,
                ),
                controller: _usernameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 8.0,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hasFloatingPlaceholder: true,
                ),
                controller: _passwordController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12.0),
              padding: const EdgeInsets.only(right: 16.0),
              alignment: Alignment.centerRight,
              child: Text('Forgot your password?'),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16.0),
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text('Already have an account?'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
              ),
            ),
            const SizedBox(
              height: 70.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                padding: const EdgeInsets.fromLTRB(40.0, 8.0, 30.0, 8.0),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0))),
                onPressed: () {
                  final username = _usernameController.text;
                  final password = _passwordController.text;

                  submit(context, username, password);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sign Up'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/login.dart';

class SignUp extends StatelessWidget {
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
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0))),
                onPressed: () {

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

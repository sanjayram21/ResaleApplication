import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';
  final _formKey = GlobalKey<FormState>();
  Future<void> sendPasswordResetEmail(String email) async {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  
  /*Future<void> _passwordReset(String _email) async {
  try {
  _formKey.currentState.save();
  await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ConfirmEmail();
      }),
  );
} catch (e) {
  print(e);
}
}*/
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your Email',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              TextFormField(

                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      errorStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (String? value) {
                      return value!.isEmpty ? 'Email can\'t be empty' : null;
                    },
                  ),
              SizedBox(height: 20,),
              new RaisedButton(
                child: new Text('Send Email'),
                onPressed: ()  {

                //ar response = await checkEmail();
                //setState(() {
                //this._emailValidator = response;
                  },),
                //if (_formKey.currentState.validate()) {
              //_formKey.currentState.save();
              //try {
                //  await FirebaseAuth.instance.sendPasswordResetEmail(_email);
                //} catch (e) {
                //print(e);
                //}
              // }

                 //},
                //onPressed: () {
                //  _passwordReset();
                 // print(_email);
                //},
              //),
              
             
                  
              new FlatButton(
                child: Text('Sign In'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}


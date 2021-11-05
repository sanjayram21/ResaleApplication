import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';



class ForgotPassword extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fp.gif'), fit: BoxFit.contain),
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
        title:Text("Forgot Password"),
        ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter Email",
                border: OutlineInputBorder()),
              ),
              SizedBox(

                height: 10,
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                color: Colors.blue,
                onPressed:() {
                  resetPassword(context);
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(color: Colors.white)
                  ),
                ),
              ),
            ],
          ),
        ),
      )
   );
  } 
      
  
  
  void resetPassword(BuildContext context) async{
    if(editController.text.length==0 || !editController.text.contains("@")){
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }
    await FirebaseAuth.instance
    .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
      msg: 
        "Reset password email has been sent to your mail.please use it to reset password..");
    Navigator.pop(context);
  }
}
      
  

   

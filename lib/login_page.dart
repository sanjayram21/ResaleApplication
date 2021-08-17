import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  FormType _formType = FormType.login;

  final formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          print('Signed in: ${userCredential.user!.uid}');
        } else {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          print('Registerd User is ${userCredential.user!.uid}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState!.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState!.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login page'),
      ),
      body: new Container(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 24),
        child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildInputs() + buildSubmitButtons(),
            )),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(
            fillColor: Colors.grey.shade300,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(0)),
            labelText: 'Email'),
        validator: (String? value) {
          return value!.isEmpty ? 'Email can\'t be empty' : null;
        },
        onSaved: (value) => _email = value.toString(),
      ),
      SizedBox(height: 24,),
      new TextFormField(
        decoration: new InputDecoration(
            fillColor: Colors.grey.shade300,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(0)),
            labelText: 'Password'),
        obscureText: true,
        validator: (String? value) {
          if (value!.isEmpty)
            return 'Password can\'t be empty';
          else if (value.toString().length < 6)
            return 'Password length should be greater than six';
          else
            return null;
        },
        onSaved: (value) => _password = value.toString(),
      ),
      SizedBox(height: 24),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        new ElevatedButton(
            onPressed: validateAndSubmit,
            child: new Text(
              'Login',
              style: new TextStyle(fontSize: 20.0),
            )),
        new TextButton(
            onPressed: moveToRegister,
            child: new Text(
              'Create an account',
              style: new TextStyle(fontSize: 20.0),
            ))
      ];
    } else {
      return [
        new ElevatedButton(
            onPressed: validateAndSubmit,
            child: new Text(
              'Create an account',
              style: new TextStyle(fontSize: 20.0),
            )),
        new TextButton(
            onPressed: moveToLogin,
            child: new Text(
              'Already have an account ? Click here to login',
              style: new TextStyle(fontSize: 15.0),
            ))
      ];
    }
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  String username = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 20,),
            Username(),
            SizedBox(height: 20,),
            Email(),
            SizedBox(height: 20,),
            Password(),
            SizedBox(height: 20,),
            submit(),
          ],
        ),
      ),
    );
  }

  Widget Username() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
        border: OutlineInputBorder(),
      ),
      maxLength: 20,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => value!.length < 8 ? "Enter at least 7 characters" : null,
      onSaved: (value) => setState(() => username = value!),
    );
  }

  Widget Email() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(),
      ),
      onSaved: (value) => setState(() => email = value!),
      validator: (value) {
        final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if(value!.isEmpty){
          return "Enter an Email";
        } else if (!regExp.hasMatch(value!)) {
          return "Enter a valid email";
        }else{
          return null;
        }
      }
    );
  }

  Widget Password() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      onSaved: (value) => setState(() => password = value!),
      validator: (value) => value!.length < 8 ? "Password must be at least 7 characters long" : null,
    );
  }

  submit() {
    return ElevatedButton(
        onPressed: (){
          final isValid = formKey.currentState?.validate();
          if (true){
            formKey.currentState?.save();

            final message = "Username: $username\nPassword: $Password()\nEmail: $email ";
            final snackBar = SnackBar(content: Text(
              message,
              style: TextStyle(fontSize: 20),
            ));
          }
        },
        child: Container(
            child: Text("Submit"))
    );
  }
}

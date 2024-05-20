import 'package:example1/mixins/validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with Validators {
  final globalformkey = GlobalKey<FormState>();

  Map<String, String> formdata = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: globalformkey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
            ),
            emailfield(),
            Container(
              margin: const EdgeInsets.all(20),
            ),
            passwordfield(),
            Container(
              margin: const EdgeInsets.all(20),
            ),
            submitbutton()
          ],
        ),
      ),
    );
  }

  Widget emailfield() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        formdata['email'] = newValue!;
      },
      validator: emailValid,
      decoration: const InputDecoration(
        hintText: "example@gmail.com",
        labelText: "Email",
      ),
    );
  }

  Widget passwordfield() {
    return TextFormField(
      onSaved: (newValue) {
        formdata['password'] = newValue!;
      },
      validator: passwordValid,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
        labelText: "Password",
      ),
    );
  }

  Widget submitbutton() {
    return ElevatedButton(
      child: const Text("submit"),
      onPressed: () {
        if (globalformkey.currentState!.validate()) {
          globalformkey.currentState!.save();
          // print(formdata);
        }
      },
    );
  }
}

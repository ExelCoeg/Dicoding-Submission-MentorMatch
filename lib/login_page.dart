

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentormatchclone/main.dart';
import 'package:mentormatchclone/main_page.dart';


final _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
        body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text('Log In',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
            ), // Log in Header
            Container(
              margin: const EdgeInsets.all(10),
              child: CredentialsForm(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text("By clicking, you accept the terms of"),
                  Text("the Privacy Policy",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ), // Privacy Policy text
            Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text("Or sign up with"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15)),
                            onPressed: () {},
                            child: Icon(Icons.facebook, color: Colors.black)),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15)),
                            onPressed: () {},
                            child: FaIcon(FontAwesomeIcons.google,
                                color: Colors.black)),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15)),
                            onPressed: () {},
                            child: FaIcon(FontAwesomeIcons.linkedinIn,
                                color: Colors.black)),
                      ],
                    )
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Sign Up Clicked");
                    },
                    child: Text(' Sign Up',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ) // sign up text button
          ],
        ),
      ),
     );
  }
}

class CredentialsForm extends StatefulWidget {
  const CredentialsForm({super.key});

  @override
  State<CredentialsForm> createState() => _CredentialsFormState();
}

class _CredentialsFormState extends State<CredentialsForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailTextField(),
          const SizedBox(height: 10.0),
          PasswordFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(overlayColor: Colors.transparent),
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.grey),
                  )),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // HomePage();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                    return const MainPage();
                  }),(Route<dynamic> route) => false,);
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form is invalid!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 25)),
              child: Text("Log In",
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

class EmailTextField extends StatefulWidget {
  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final _emailController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    print("null1");
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        contentPadding: const EdgeInsets.all(20),
        labelText: 'Email',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      validator: validateEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  final _passwordController = TextEditingController();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    print("null2");
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        contentPadding: const EdgeInsets.all(20),
        labelText: 'Password',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      validator: validatePassword,
      // Set the correct validator here
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }


}

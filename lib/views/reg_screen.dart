import 'package:flutter/material.dart';
import 'package:college_bay/theme/routes.dart';
import 'package:college_bay/views/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _retypePasswordController = new TextEditingController();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/logo.png",
      height: mq.size.height / 4,
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: "username@college.edu",
        labelText: "Email",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final usernameField = TextFormField(
      controller: _usernameController,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: "firstname.lastname",
        labelText: "Username",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final passwordField = TextFormField(
      controller: _passwordController,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: "8-15 characters long",
        labelText: "Password",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final retypePasswordField = TextFormField(
      controller: _retypePasswordController,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: "8-15 characters long",
        labelText: "Retype Password",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final fields = Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              usernameField,
              emailField,
              passwordField,
              retypePasswordField,
            ]));

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          try {
            FirebaseUser user =
                (await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            )).user;
            if (user != null) {
              UserUpdateInfo updateUser = UserUpdateInfo();
              updateUser.displayName = _usernameController.text;
              user.updateProfile(updateUser);
              Navigator.of(context).pushNamed(AppRoutes.homepage);
            }
          } catch (except) {
            print(except);
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        registerButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Already a user?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                  ),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.authLogin);
                },
                child: Text(
                  "Login here",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                ))
          ],
        )
      ],
    );

    return Scaffold(
        backgroundColor: Color(0xff659dbd),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                padding: EdgeInsets.all(36),
                child: Container(
                    height: mq.size.height,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          logo,
                          fields,
                          Padding(
                            padding: EdgeInsets.only(bottom: 70),
                            child: bottom,
                          ),
                        ])))));
  }
}

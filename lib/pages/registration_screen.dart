import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // formkey
  final _formkey = GlobalKey<FormState>();
  // editing controllers
  final nameController = new TextEditingController();
  final numController = new TextEditingController();
  final addressController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // name
    final NameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return 'Name cannot be empty';
        }
        if (!regex.hasMatch(value)) {
          return '(Min 3 characters are required)';
        }
      },
      controller: nameController,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // phone_number
    final NumberField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.length != 10) {
          return "Enter 10 characters";
        }
      },
      controller: numController,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Phone number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // address
    final AdrressField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      controller: addressController,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.home),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Address',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // email
    final EmailField = TextFormField(
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Please enter some text');
        }
        // reg expression email for validation
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ('Please Enter a valid Email');
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'E-mail',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
// Password
    final PasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return 'Please enter password';
        }
        if (!regex.hasMatch(value)) {
          return '(Min 6 characters are required)';
        }
      },
      controller: passwordController,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // Confirm Password
    final confirmPasswordfield = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) {
        if (passwordController.text != confirmPasswordController.text) {
          return "Password don't match";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      controller: confirmPasswordController,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Confirm Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    // sign up button
    final SignUp = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(40),
      color: Colors.lightBlueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: Text(
          'Sign-Up',
          style: TextStyle(
            // color: Colors.black,
            fontSize: 15.6,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.lightBlueAccent,
          ),
          // passing this to
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Register Yourself!',
          style: TextStyle(color: Colors.lightBlueAccent),
        ),
      ),
      //backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            // color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 146,
                          child: Image.asset(
                            "Assets/doc_pat.jpg",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      NameField,
                      SizedBox(
                        height: 30,
                      ),
                      NumberField,
                      SizedBox(
                        height: 30,
                      ),
                      AdrressField,
                      SizedBox(
                        height: 30,
                      ),
                      EmailField,
                      SizedBox(
                        height: 30,
                      ),
                      PasswordField,
                      SizedBox(
                        height: 30,
                      ),
                      confirmPasswordfield,
                      SizedBox(
                        height: 15,
                      ),
                      SignUp,
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling firestore
    // calling user model
    // sending data to firestore

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.phone_no = numController.text;
    userModel.address = addressController.text;
    userModel.name = nameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account Created Successfully');

    Navigator.pushNamed(context, MyRoute.homeRoute);
  }
}

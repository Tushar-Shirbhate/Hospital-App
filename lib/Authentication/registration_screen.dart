//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hospital_app/utils/routes.dart';
// import 'package:hospital_app/utils/user_model.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({ Key? key }) : super(key: key);
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _auth=FirebaseAuth.instance;
//
//   // formkey
//   final _formkey=GlobalKey<FormState>();
//   // editing controllers
//   final nameController= new TextEditingController();
//   final numController= new TextEditingController();
//   final addressController= new TextEditingController();
//   final emailController= new TextEditingController();
//   final passwordController= new TextEditingController();
//   final confirmPasswordController= new TextEditingController();
//   @override
//
//
//
//   Widget build(BuildContext context) {
//   // name
//      final NameField = TextFormField(
//       autofocus: false,
//       keyboardType: TextInputType.text,
//       validator: (value){
//        // RegExp regex = new RegExp(r'^.{3,}$');
//         RegExp regex = RegExp(r"(\w+)");
//         String str = "user";
//         Iterable<RegExpMatch> matches = regex.allMatches(str);
//         if(value!.isEmpty)
//         {
//           return 'Name cannot be empty';
//         }
//         if(value.startsWith("user")){
//           return "Password should contain 'user' at starting";
//         }
//         if(!regex.hasMatch(value))
//         {
//           return '(Min 3 characters are required)';
//         }
//       },
//       controller: nameController,
//       onSaved: (value) {
//         nameController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.person_rounded),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: 'Name',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
//   // phone_number
//   final NumberField = TextFormField(
//       autofocus: false,
//       keyboardType: TextInputType.number,
//       validator: (value){
//         if(value!.length!=10)
//         {
//           return "Enter 10 characters";
//         }
//       },
//       controller: numController,
//       onSaved: (value) {
//         nameController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.phone),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: 'Phone number',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
//   // address
//      final AdrressField = TextFormField(
//       autofocus: false,
//       keyboardType: TextInputType.text,
//       controller: addressController,
//       onSaved: (value) {
//         nameController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.home),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: 'Address',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
//   // email
//     final EmailField = TextFormField(
//       autofocus: false,
//       validator: (value){
//         if(value!.isEmpty)
//         {
//          return ('Please enter some text');
//         }
//         // reg expression email for validation
//         if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
//         {
//           return ('Please Enter a valid Email');
//         }
//         return null;
//       },
//       keyboardType: TextInputType.emailAddress,
//       controller: emailController,
//       onSaved: (value) {
//         nameController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.email),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: 'E-mail',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
// // Password
//     final PasswordField = TextFormField(
//       autofocus: false,
//       obscureText: true,
//       keyboardType: TextInputType.text,
//       validator: (value)
//       {
//       //  RegExp regex = new RegExp(r'^.{6,}$');
//         if(value!.isEmpty)
//         {
//           return 'Please enter password';
//         }
//         // if(!value.startsWith("user")){
//         //   return "Password should contain 'user' at starting";
//         // }
//         // if(!regex.toString().startsWith("user"))
//         // {
//         //   return '(user characters are required)';
//         // }
//         // if(!regex.hasMatch(value))
//         // {
//         //   return '(Min 6 characters are required)';
//         // }
//       },
//       controller: passwordController,
//       onSaved: (value) {
//         nameController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.vpn_key),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: 'Password',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
//   // Confirm Password
//     final confirmPasswordfield = TextFormField(
//       autofocus: false,
//       obscureText: true,
//       validator: (value){
//         if(passwordController.text!=confirmPasswordController.text)
//         {
//           return "Password don't match";
//         }
//         return null;
//       },
//       keyboardType: TextInputType.text,
//       controller: confirmPasswordController,
//       onSaved: (value) {
//         nameController.text = value!;
//       },
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.vpn_key),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: 'Confirm Password',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           )),
//     );
//   // sign up button
//      final SignUp = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(40),
//       color: Colors.lightBlueAccent,
//       child: MaterialButton(
//         padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         onPressed: () {
//           signUp(emailController.text, passwordController.text);
//         },
//         child: Text(
//           'Sign-Up',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 15.6,
//           ),
//         ),
//       ),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,color: Colors.lightBlueAccent,),
//           // passing this to
//            onPressed: () {
//                       Navigator.pop(context);
//                     },
//           ),
//           title: Text('Register Yourself!',style: TextStyle(color: Colors.lightBlueAccent),),
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(left: 8, right: 8),
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(30),
//               child: Form(
//                   key: _formkey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       SizedBox(
//                           height: 146,
//                           child: Image.asset(
//                             "Assets/doc_pat.jpg",
//                             fit: BoxFit.contain,
//                           )),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       NameField,
//                       SizedBox(
//                         height: 30,
//                       ),
//                       NumberField,
//                       SizedBox(
//                         height: 30,
//                       ),
//                        AdrressField,
//                       SizedBox(
//                         height: 30,
//                       ),
//                       EmailField,
//                       SizedBox(
//                         height: 30,
//                       ),
//                        PasswordField,
//                       SizedBox(
//                         height: 30,
//                       ),
//                        confirmPasswordfield,
//                       SizedBox(
//                         height: 15,
//                       ),
//                       SignUp,
//
//                     ],
//                   )),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void signUp(String email,String password) async
//   {
//     if(_formkey.currentState!.validate()){
//       await _auth.createUserWithEmailAndPassword(email: email, password: password)
//       .then((value) => {
//         postDetailsToFirestore(),
//       }).catchError((e){
//         Fluttertoast.showToast(msg: e!.message);
//       }
//       );
//     }
//   }
//
//
//   postDetailsToFirestore() async
//   {
//     // calling firestore
//     // calling user model
//     // sending data to firestore
//
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   User? user = _auth.currentUser;
//   UserModel userModel = UserModel();
//
//
//   // writing all the values
//   userModel.email=user!.email;
//   userModel.uid=user.uid;
//   userModel.phone_no=numController.text;
//   userModel.address=addressController.text;
//   userModel.name=nameController.text;
//
//
//   await firebaseFirestore
//   .collection("users")
//   .doc(user.uid)
//   .set(userModel.toMap());
//  Fluttertoast.showToast(msg: 'Account Created Successfully');
//
//    Navigator.pushNamed(context, MyRoute.homeRoute);
//
//
//   }
//
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hospital_app/Authentication/login_screen.dart';
import 'package:hospital_app/pages/home_page.dart';
// import 'package:untitled/Authentication/LoginScreen.dart';
// import 'package:untitled/Screen/HomeScreen.dart';

import 'Methods.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    bool obs_text=true;
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color:  Color.fromRGBO(254, 23, 72, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(45, 0,15,0),
            child: Text("Register Yourself!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromRGBO(254, 23, 72, 1)),

            ),
          ),
          elevation: 0,
          backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        ),
        body: isLoading
            ? Center(
            child: Container(child: CircularProgressIndicator())
        )
            :Center(
              child: SingleChildScrollView(
              padding: EdgeInsets.all(15),
                child: Card(
                // margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                  color: Color.fromRGBO(254, 23, 72, 1),),
                  color: Color.fromRGBO(250, 228, 252, 1),
                ),
                  height: size.height / 1.0,
                  width: double.infinity,

          child: Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "Assets/images/patientTwo.png",
                          fit: BoxFit.fitHeight,
                          height: 146,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: size.height / 14,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          color: Color.fromRGBO(250, 228, 252, 1),
                        ),
                        child: TextField(
                            controller:_name,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_rounded,
                                  color: Color.fromRGBO(254, 23, 72, 1),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Name",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                    width: 2.0,
                                  ),
                                )
                               // labelText: "Name"
                            )
                        ),
                      ),SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: size.height / 14,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          color: Color.fromRGBO(250, 228, 252, 1),
                        ),
                        child: TextField(
                            controller:_phoneNo,
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone,
                                  color: Color.fromRGBO(254, 23, 72, 1),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Mobile Number",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                    width: 2.0,
                                  ),
                                )
                               // labelText: "Name"
                            )
                        ),
                      ),SizedBox(
                          height: 20
                      ),
                      Container(
                        height: size.height / 14,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          color: Color.fromRGBO(250, 228, 252, 1),
                        ),
                        child: TextField(
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            controller:_email,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email,
                                color: Color.fromRGBO(254, 23, 72, 1),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "E-mail",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                    width: 2.0,
                                  ),
                                )
                              //  labelText: "Email"
                            )
                        ),
                      ),
                      SizedBox(
                          height: 20
                      ),Container(
                        height: size.height / 14,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          color: Color.fromRGBO(250, 228, 252, 1),
                        ),
                        child: TextField(
                            obscureText: obs_text?true:false,
                            autofocus: false,
                            controller: _password,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key,
                                color: Color.fromRGBO(254, 23, 72, 1),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              suffixIcon: IconButton(
                                icon:Icon(Icons.remove_red_eye,
                                  color: Color.fromRGBO(254, 23, 72, 1),
                                ),onPressed: (){
                                obs_text=false;
                                // setState(() {
                                //
                                // });
                              },),
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Password",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                    width: 2.0,
                                  ),
                                )
                              // labelText: "Password"
                            )
                        ),
                      ),
                      // SizedBox(
                      //     height: 30
                      // ),TextField(
                      //     autofocus: false,
                      //     controller: _profession,
                      //     textInputAction: TextInputAction.next,
                      //     decoration: InputDecoration(
                      //       prefixIcon: Icon(Icons.school),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10)
                      //       ),
                      //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      //       hintText: "Hospital/User",
                      //     )
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: size.height / 14,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          color: Color.fromRGBO(250, 228, 252, 1),
                        ),
                        child: TextField(
                            controller:_address,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.home,
                                  color: Color.fromRGBO(254, 23, 72, 1),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Address",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    // color: Color.fromRGBO(250, 228, 252, 1),
                                    color: Color.fromRGBO(254, 23, 72, 1),
                                    width: 2.0,
                                  ),
                                )
                               // labelText: "Name"
                            )
                        ),
                      ),
                      SizedBox(
                          height: 20
                      ),
                      GestureDetector(
                          onTap: (){
                            if(_name.text.isNotEmpty && _phoneNo.text.isNotEmpty && _email.text.isNotEmpty && _password.text.isNotEmpty && _address.text.isNotEmpty){
                              setState(() {
                                isLoading = true;
                              });

                              signUp(_name.text, _phoneNo.text, _email.text, _password.text, _address.text).then((user){
                                if(user != null){
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => HomePage())
                                  );
                                }
                                else{
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              });
                            } else{
                              print("please fill the form correctly");
                            }
                          },
                          child: Container(
                              height: size.height / 14,
                              width: size.width / 3.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Color.fromRGBO(254, 23, 72, 1),
                                  // color: Colors.blue
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 15.6,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                          )
                      ),
                      // SizedBox(height: 15,),
                      // GestureDetector(
                      //     onTap: (){
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(builder: (_)=> LoginScreen())
                      //       );
                      //     },
                      //     child: Container(
                      //         alignment: Alignment.center,
                      //         child: Text(
                      //             "Log In",
                      //             style: TextStyle(
                      //                 fontSize: 15,
                      //                 color: Colors.blue,
                      //                 fontWeight: FontWeight.bold
                      //             )
                      //         )
                      //     )
                      // ),
                    ]
              ),
              ),
          ),
        ),
              )),
            )
    );
  }
}

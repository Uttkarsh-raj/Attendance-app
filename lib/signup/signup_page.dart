// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:task/login/login_page.dart';

import '../login/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool admin = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
    phoneController.clear();
    nameController.clear();
    passController.clear();
    ageController.clear();
    super.dispose();
  }

  void showSnackBar(String text) {
    var snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List s = [
    " Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} Time: ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0).copyWith(left: 10, right: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 22),
                  Image.asset('asset/images/register.png'),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.app_registration_outlined,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Name: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        width: size.width * 0.67,
                        height: size.height * 0.055,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.2,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(5.0).copyWith(bottom: 10),
                          child: Center(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[500],
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                              controller: nameController,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Email: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        width: size.width * 0.67,
                        height: size.height * 0.055,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.2,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(5.0).copyWith(bottom: 10),
                          child: Center(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[500],
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                              controller: emailController,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Password: ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        width: size.width * 0.67,
                        height: size.height * 0.055,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.2,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(5.0).copyWith(bottom: 10),
                          child: Center(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[500],
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                              controller: passController,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          value: admin,
                          onChanged: (value) {
                            setState(() {
                              admin = !admin;
                            });
                          }),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            admin = !admin;
                          });
                        },
                        child: const Text('Admin Account'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      // await FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(
                      //         email: emailController.text.toString(),
                      //         password: passController.text.toString());
                      // await FirebaseFirestore.instance.collection('users').add({
                      //   'email': emailController.text.toString(),
                      //   'name': nameController.text.toString(),
                      //   'phone': phoneController.text.toString(),
                      //   'age': ageController.text.toString(),
                      //   'scanned': s,
                      // });
                      // showSnackBar('Account created Successfully!! Plz Login.');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                    },
                    child: const Text('Alredy have a account? Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

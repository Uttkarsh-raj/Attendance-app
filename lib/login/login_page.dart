import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../signup/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool clicked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
    passController.clear();
    super.dispose();
  }

  void showSnackBar(String text) {
    var snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/images/login.png'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.login,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Email :',
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
                      padding: const EdgeInsets.all(5.0).copyWith(bottom: 15),
                      child: Center(
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            border: InputBorder.none,
                          ),
                          controller: emailController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Password :',
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
                      padding: const EdgeInsets.all(5.0).copyWith(bottom: 10),
                      child: Center(
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: (!clicked)
                                ? GestureDetector(
                                    onTap: () => setState(() {
                                      clicked = !clicked;
                                    }),
                                    child: const Icon(Icons.visibility_off),
                                  )
                                : GestureDetector(
                                    onTap: () => setState(() {
                                      clicked = !clicked;
                                    }),
                                    child: const Icon(Icons.visibility),
                                  ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            border: InputBorder.none,
                          ),
                          obscureText: (!clicked) ? true : false,
                          controller: passController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passController.text);
                    const Duration(seconds: 2);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const MainPage(),
                    //   ),
                    // );
                  } catch (e) {
                    showSnackBar('$e');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ));
                  },
                  child: const Text('Dont have a account? Sign Up'))
            ],
          ),
        ),
      ),
    );
  }
}

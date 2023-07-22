import 'package:attendence_app/home_page/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        centerTitle: true,
        title: const Text('Attendence App'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(right: 15),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Icon(
                Icons.logout_outlined,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.08),
            Image.asset('asset/images/presentation.png'),
            SizedBox(height: size.height * 0.03),
            CustomButton(
              label: 'Tap to Start your Shift',
              icon: Icon(
                Icons.delivery_dining,
                size: 40,
                color: Colors.black.withOpacity(0.6),
              ),
              onTap: () {
                showCustomDialog(
                  context,
                  Lottie.asset('asset/gifs/delivery.json'),
                  'Thank you for providing your constant support and service. Have a great day ahead...',
                  'Good Day !!!',
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            CustomButton(
              label: 'Tap to End your Shift',
              icon: Icon(
                Icons.home_outlined,
                size: 40,
                color: Colors.black.withOpacity(0.6),
              ),
              onTap: () {
                showCustomDialog(
                  context,
                  Lottie.asset(
                    'asset/gifs/sleepy.json',
                  ),
                  'Thank you for providing your constant support and service. You should get yourself some rest...',
                  'Good Night !!!',
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            CustomButton(
              label: 'Check Attandence Details',
              icon: Icon(
                Icons.calendar_month_outlined,
                size: 30,
                color: Colors.black.withOpacity(0.6),
              ),
              onTap: () {},
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  void showCustomDialog(
      BuildContext context, Widget animation, String body, String regards) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Scaffold(
                body: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0).copyWith(bottom: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Recorded',
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 31, 22),
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: animation,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text(
                                body,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 26, 31, 22),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text(
                                regards,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 26, 31, 22),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

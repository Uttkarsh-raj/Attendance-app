import 'package:attendence_app/home_page/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            ),
            SizedBox(height: size.height * 0.03),
            CustomButton(
              label: 'Tap to End your Shift',
              icon: Icon(
                Icons.home_outlined,
                size: 40,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            CustomButton(
              label: 'Check Attandence Details',
              icon: Icon(
                Icons.calendar_month_outlined,
                size: 30,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

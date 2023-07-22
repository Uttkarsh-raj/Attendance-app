import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.icon});
  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.74,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 162, 64, 201).withOpacity(0.8),
            width: 1.8,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.07).copyWith(
            top: 3,
            bottom: 3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              icon
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kmdha/ui/screens/home_screen.dart';
import 'resend_timer_btn.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpField extends StatefulWidget {
  final VoidCallback toggleLogin;
  const OtpField({
    super.key,
    required this.toggleLogin,
  });

  @override
  State<OtpField> createState() => OtpFieldState();
}

class OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 20),
          otpLabel(),
          const SizedBox(height: 20),
          otpText(),
          const SizedBox(height: 20),
          buildPinPut(),
          const SizedBox(height: 20),
          ResendOtpButtonWithTimer(
            onResendOtp: () {
              // Implement the resend OTP logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP has been resent.')),
              );
            },
          ),
          const SizedBox(height: 20),
          reEnterButton(),
        ],
      ),
    );
  }

  Widget buildPinPut() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(93, 56, 48, 48)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      onCompleted: (pin) {
        if (pin == "1234") {
          Timer(
            const Duration(seconds: 1),
            () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Verified successfully.')),
          );
          void setUsrLogin() async {
            SharedPreferences perfs = await SharedPreferences.getInstance();
            perfs.setBool("isUserLogin", true);
          }

          setUsrLogin();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid OTP. Please try again.')),
          );
        }
      },
    );
  }

  Widget otpLabel() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'OTP Number',
        style: TextStyle(fontSize: 26, color: Colors.black),
      ),
    );
  }

  Widget otpText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Enter the OTP sent to your mobile.',
        style: TextStyle(fontSize: 18, color: Colors.blueGrey),
      ),
    );
  }

  Widget reEnterButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle re-enter number logic here
        widget.toggleLogin();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 50),
        backgroundColor: Colors.blue,
      ),
      child: const Text(
        'Re-enter Number',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

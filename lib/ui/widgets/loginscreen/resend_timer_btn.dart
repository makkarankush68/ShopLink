import 'dart:async';
import 'package:flutter/material.dart';

class ResendOtpButtonWithTimer extends StatefulWidget {
  final VoidCallback onResendOtp;

  const ResendOtpButtonWithTimer({super.key, required this.onResendOtp});

  @override
  State<ResendOtpButtonWithTimer> createState() => _ResendOtpButtonWithTimerState();
}

class _ResendOtpButtonWithTimerState extends State<ResendOtpButtonWithTimer> {
  late Timer _timer;
  int _remainingTime = 60;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _remainingTime = 60;
      _isButtonDisabled = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isButtonDisabled = false;
          _timer.cancel();
        }
      });
    });
  }

  void _resendOtp() {
    widget.onResendOtp();

    // Restart the timer
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: _isButtonDisabled ? null : _resendOtp,
          child: Text(
            'Resend OTP',
            style: TextStyle(
              color: _isButtonDisabled ? Colors.grey : Colors.blue,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '$_remainingTime',
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ],
    );
  }
}

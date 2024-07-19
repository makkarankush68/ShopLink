import 'package:flutter/material.dart';
import 'package:kmdha/constant/img_constants.dart';
import 'package:flutter/services.dart';

class PhoneField extends StatefulWidget {
  final VoidCallback toggleLogin;
  const PhoneField({
    super.key,
    required this.toggleLogin,
  });

  @override
  State<PhoneField> createState() => PhoneFieldState();
}

class PhoneFieldState extends State<PhoneField> {
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  void dispose() {
    _phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          phoneNumberLabel(),
          const SizedBox(height: 20),
          phoneNumberText(),
          const SizedBox(height: 20),
          phoneNumberInput(),
          const SizedBox(height: 20),
          termsAndConditions(),
          const SizedBox(height: 20),
          getOtpButton(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget phoneNumberLabel() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Phone Number',
        style: TextStyle(fontSize: 26, color: Colors.black),
      ),
    );
  }

  Widget phoneNumberText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Enter your phone number to get OTP.',
        style: TextStyle(fontSize: 18, color: Colors.blueGrey),
      ),
    );
  }

  Widget phoneNumberInput() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                Image.asset(flagIndian, height: 28),
                const SizedBox(width: 10),
                const Text(
                  '+91',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: _phoneNumber,
            keyboardType: TextInputType.phone,
            style: const TextStyle(fontSize: 20),
            maxLength: 10,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 107, 194), width: 1.5)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              hintText: 'Enter phone number',
            ),
          ),
        ),
      ],
    );
  }

  Widget termsAndConditions() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "By providing my phone number, I hereby agree and accept the Terms of service and Privacy Policy in use of the ShopLink App",
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        style: TextStyle(color: Colors.blueGrey),
      ),
    );
  }

  Widget getOtpButton() {
    void validateAndSendOtp() {
      final phoneNumberRegExp = RegExp(r'^[6-9]\d{9}$');
      final phoneNumber = _phoneNumber.text;
      if (phoneNumberRegExp.hasMatch(phoneNumber)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent to $phoneNumber.')),
        );
        widget.toggleLogin(); // Call the toggleLogin function
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid phone number.')),
        );
      }
    }

    return ElevatedButton(
      onPressed: () {
        validateAndSendOtp();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 50),
        backgroundColor: Colors.blue,
      ),
      child: const Text(
        'Get OTP',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}



/// with google and additional buttons
/**
 * import 'package:flutter/material.dart';
// import 'package:kmdha/constants/constants.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key});

  @override
  State<PhoneField> createState() => PhoneFieldState();
}

class PhoneFieldState extends State<PhoneField> {
  // bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // clipBehavior: ,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone Number',
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  'Number',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
              ],
            ),

            // const SizedBox(height: 20),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Password',
            //     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            //   ),
            // ),
            // const SizedBox(height: 5),
            // TextField(
            //   style: const TextStyle(fontSize: 20),
            //   decoration: InputDecoration(
            //     // border: const OutlineInputBorder(),
            //     contentPadding:
            //         const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            //     suffixIcon: IconButton(
            //       icon: Icon(
            //         _obscureText ? Icons.visibility : Icons.visibility_off,
            //       ),
            //       onPressed: () {
            //         setState(() {
            //           _obscureText = !_obscureText;
            //         });
            //       },
            //     ),
            //   ),
            //   obscureText: _obscureText,
            // ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Continue'),
            ),
            const SizedBox(height: 10),
            // TextButton(
            //   onPressed: () {
            //     // Handle forgot password logic here
            //   },
            //   child: const Text('Forgot Password?'),
            // ),
            //   const SizedBox(height: 10),
            //   const Text(
            //     '-- Or --',
            //     style: TextStyle(color: Colors.grey),
            //   ),
            //   const SizedBox(height: 10),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       IconButton(
            //         icon: Image.asset(
            //           'assets/googleLogo.png',
            //           height: 50,
            //         ), // Provide the correct path to your Google logo asset
            //         iconSize: 50,
            //         onPressed: () {
            //           // Handle Google login logic here
            //         },
            //       ),
            //       const SizedBox(width: 20),
            //       IconButton(
            //         icon: Image.asset(
            //           'assets/facebookLogo.png',
            //           height: 50,
            //         ), // Provide the correct path to your Facebook logo asset
            //         iconSize: 50,
            //         onPressed: () {
            //           // Handle Facebook login logic here
            //         },
            //       ),
            //     ],
            //   ),
          ],
        ),
      ),
    );
  }
}

 */
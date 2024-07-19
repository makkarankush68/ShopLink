import 'package:flutter/material.dart';
import 'package:kmdha/ui/screens/home_screen.dart';
import '../widgets/loginscreen/login_crousel.dart';
import '../widgets/loginscreen/phone_field.dart';
import '../widgets/loginscreen/otp_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  Future<void> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? t = prefs.getBool("isUserLogin");
    setState(() {
      if (t == true) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isUserLoggedIn();
  }

  bool isLogin = true;
  void toggleLogin() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          const LoginStack(),
          isLogin
              ? PhoneField(toggleLogin: toggleLogin)
              : OtpField(toggleLogin: toggleLogin),
        ],
      ),
    );
  }
}

class LoginStack extends StatelessWidget {
  const LoginStack({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        const Column(
          children: [
            LoginCrousel(),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -5,
          child: Container(
            height: 25,
            decoration: const BoxDecoration(
                color: Color(0xfffff8ff),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: const Text(""),
          ),
        ),
      ],
    );
  }
}

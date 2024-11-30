import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_care/constant/color.dart';
import 'package:house_care/views/login/signup.dart';
import 'package:house_care/views/property/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool? value = true;
  bool obscurePassword = true;

  login(context) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      emailController.clear();
      passController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const Text('No user found for that email.'),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        emailController.clear();
        passController.clear();
      } else if (e.code == 'wrong-password') {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const Text('Wrong password provided for that user.'),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        emailController.clear();
        passController.clear();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset("assets/images/logo.png"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "Login to Your Account",
                style: TextStyle(
                  color: customBlackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: customGreyColor,
                  prefixIcon: const Icon(
                    Icons.email,
                    size: 18,
                    color: customBlackColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: customGreyColor),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: customBlackColor),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  hintText: 'Email Address',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: customBlackColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                obscureText: obscurePassword,
                controller: passController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: customGreyColor,
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 18,
                    color: customBlackColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: 18,
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: customGreyColor),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: customBlackColor),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: customBlackColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: customBlueColor,
                    value: value,
                    onChanged: (bool? newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                  const Text("Remember me"),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: customBlueColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ]),
              width: MediaQuery.of(context).size.width * .9,
              height: 50,
              child: TextButton(
                onPressed: () async {
                  await login(context);
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: primaryBgColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                child: const Text(
                  "Forgot the password?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: customBlueColor,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: greyBorderColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "or continue with",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: greyTxtColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: greyBorderColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 55,
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                          color: greyBorderColor,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/icon-facebook.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 55,
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                          color: greyBorderColor,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/icon-google.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 55,
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                          color: greyBorderColor,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/icon-apple.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: greySmallTxtColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpView(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: customBlueColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

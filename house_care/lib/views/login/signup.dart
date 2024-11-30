import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_care/constant/color.dart';
import 'package:house_care/views/login/login.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool? value = true;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  registerUser(context) async {
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: const Text('User Registered Successfully...'),
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const Text('The password provided is too weak.'),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'email-already-in-use') {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const Text('The account already exists for that email.'),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset("assets/images/logo.png"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "Create a Sign Up Account",
                style: TextStyle(
                  color: customBlackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Full Name Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: customGreyColor,
                  prefixIcon: const Icon(
                    Icons.person,
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
                  hintText: 'Full Name',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: customBlackColor,
                  ),
                ),
              ),
            ),
            // Email or Username Field
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
            // Password Field
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
            // Confirm Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                obscureText: obscureConfirmPassword,
                controller: confirmPassController,
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
                      obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
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
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: customBlackColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  await registerUser(context);
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: primaryBgColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account.",
                    style: TextStyle(
                      color: greySmallTxtColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                    child: const Text(
                      "Log In",
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

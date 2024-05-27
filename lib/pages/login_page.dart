import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller
  final _emailController = TextEditingController();
  final __passwordController = TextEditingController();

  Future signIn() async {

    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(),);
    });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: __passwordController.text.trim());

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    __passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                // hello again
                const Text(
                  "Hello Again",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: __passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                //sign in button
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPasswordPage()));
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: signIn,
                  child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                //not a member? register now

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

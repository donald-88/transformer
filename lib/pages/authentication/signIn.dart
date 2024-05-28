import 'package:flutter/material.dart';

import '../../widgets/myTextInput.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
TextEditingController idNumberController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void signIn() async{
  String idNumber = idNumberController.text;
  String password = passwordController.text;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 250, child: Image.asset('assets/logo.png')),
                const SizedBox(height: 64),
                Text("Sign In", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 20),
                MyTextInput(controller: idNumberController,hintText: 'ID Number', obscureText: false),
                const SizedBox(height: 20),
                MyTextInput(controller: passwordController,hintText: 'Password',obscureText: true,),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(300, 60)),
                    onPressed: signIn,
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ))),
                     const SizedBox(height: 20),
                     const Text('Reset Password?')
              ],
            ),
          ),
        ),
      ),
    );
  }
}


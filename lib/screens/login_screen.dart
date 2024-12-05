import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_utix/providers/auth_provider.dart';
import 'package:uas_utix/screens/home_screen.dart';
import 'package:uas_utix/screens/navigation.dart';
import 'package:uas_utix/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController =  TextEditingController();
  final passwordController =  TextEditingController();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    }

    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email.';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'img/logo_utix.png',
                  width: 200,
                ),
                const SizedBox(height: 30,),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget> [
                      const Text(
                        'Email',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                          ),
                          fillColor: Colors.white,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please enter your email!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30,),
                      const Text(
                        'Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              
                              color: Colors.white,
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                          ),
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please enter your email!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30,),
                      FilledButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              await context.read<AuthProvider>().login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            } catch (error) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error.toString()),
                                ),
                              );
                            }

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const Navigation(0))
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(247, 67, 70, 1),),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Didn\'t have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                            ),
                          ),
                          InkWell(
                            child: const Text(
                              'Register here',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(247, 67, 70, 1),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const RegisterScreen())
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


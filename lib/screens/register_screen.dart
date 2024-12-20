import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uas_utix/screens/login_screen.dart';
import 'package:uas_utix/screens/navigation.dart';
import 'package:uas_utix/services/register_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final emailController =  TextEditingController();
    final nameController =  TextEditingController();
    final passwordController =  TextEditingController();
    final passwordConfirmController =  TextEditingController();

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
                  'Register',
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
                        'Name',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
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
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please enter your name!';
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
                            return 'Please enter your password!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30,),
                      const Text(
                        'Confirm Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                      TextFormField(
                        controller: passwordConfirmController,
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
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please reenter your password!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      FilledButton(
                        onPressed: () async {
                          if(passwordController.text == passwordConfirmController.text) {
                            await RegisterService().register(
                              email: emailController.text, 
                              password: passwordController.text
                            );
                            
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const Navigation(0))
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: 'Please reenter your password!',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.SNACKBAR,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(const Color.fromRGBO(247, 67, 70, 1),),
                        ),
                        child: const Text(
                          'Register',
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
                            'Have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                            ),
                          ),
                          InkWell(
                            child: const Text(
                              'Login here',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(247, 67, 70, 1),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => const LoginScreen())
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


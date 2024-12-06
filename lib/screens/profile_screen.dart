import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uas_utix/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final User? user = firebaseAuth.currentUser;
    String? email = user?.email ?? "No user logged in";

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(43, 43, 56, 1),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 60),
              CircleAvatar(
                backgroundImage: Image.asset('img/user_avatar.png').image,
                radius: 70,
              ),
              const SizedBox(height: 20),
              Text(
                "Email: $email",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(247, 67, 70, 1),
                ),
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                  );

                  await firebaseAuth.signOut();
                  if (kDebugMode) {
                    print("Signed out");
                  }
                },
                child: const Text(
                  "Sign out",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
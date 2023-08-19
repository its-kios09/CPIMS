import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/partner.png',
                  height: 220,
                  width: 520,
                ),
                const Text(
                  "Welcome to CPIMS",
                  style: TextStyle(fontSize: 22, fontFamily: 'JosefinSans'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F1F1),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Username"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F1F1),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your login logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan[800],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
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
// Creating a logic for the Token POST method


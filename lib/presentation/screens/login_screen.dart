import 'package:absentapps/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../domain/entities/user_model.dart';
import '../../utils/local_db.dart';
import 'face_scan_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _passwordIsVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _saveUser() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      await LocalDb().saveUser(User(
        username: _usernameController.text,
      ));
      toast('Berhasil Login');
    } else {
      toast('Username dan Password tidak boleh kosong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/astina.png'),
                      height: 250,
                      width: 250,
                    ),
                    Text(
                      'Astina Absensi Online',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Login Menggunakan Akun Karyawan Perusahaan Anda',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      5.height,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: appSecondaryBackgroundColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      5.height,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          obscureText: _passwordIsVisible,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: appSecondaryBackgroundColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordIsVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordIsVisible = !_passwordIsVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      20.height,
                      const Text(
                        'Lupa Password?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      20.height,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await _saveUser();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FaceScanScreen(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                appColorPrimary, // background color
                            minimumSize: const Size(250, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: const Text('Masuk'),
                        ),
                      ),
                      20.height,
                      const Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum punya akun karyawan?',
                              style: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      50.height,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
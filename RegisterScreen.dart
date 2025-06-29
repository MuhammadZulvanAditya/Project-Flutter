//Muhammad Zulvan Aditya
//1462200168
//SESI 4

import 'package:flutter/material.dart';
import 'package:pab_aktivitas_1/LoginPage.dart';
import 'package:pab_aktivitas_1/widget/fieldCustom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nbiController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController akunigController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView( 
    child: Form(
      key: formKey,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 7), 
            Image.asset('assets/images/pana.png', scale: 6),
            TextFieldCustom('Masukkan NBI', nbiController),
            TextFieldCustom('Masukkan Nama', namaController),
            TextFieldCustom('Masukkan Email', emailController),
            TextFieldCustom('Masukkan Alamat', alamatController),
            TextFieldCustom('Masukkan Akun Instagram', akunigController),
            TextFieldCustom('Masukkan Verifikasi Pin', pinController),
            const SizedBox(height: 7),
            SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('nbi', nbiController.text);
                    await prefs.setString('nama', namaController.text);
                    await prefs.setString('email', emailController.text);
                    await prefs.setString('alamat', alamatController.text);
                    await prefs.setString('akunig', akunigController.text);
                    await prefs.setString('pin', pinController.text);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Loginpage(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 3, 0, 197),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30), 
          ],
        ),
      ),
    ),
  ),
);

  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller =
      Get.find<LoginController>(); // Instantiate LoginController

  bool obscureText = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8ED6FF),
      body: Container(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logorl.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              Image.asset(
                'assets/pustakalogo.png',
                height: 50,
                fit: BoxFit.contain,
              ),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            Material(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              elevation: 4,
                              child: AspectRatio(
                                aspectRatio: 11.0,
                                child: Center(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Username',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(9),
                                    ),
                                    controller: controller.usernameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Username tidak boleh kosong";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 13),
                              child: Material(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                elevation: 4,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 11.0,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Password',
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(9),
                                          ),
                                          controller:
                                              controller.passwordController,
                                          obscureText: obscureText,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Password tidak boleh kosong";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: InkWell(
                                onTap: () async {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    String username =
                                        controller.usernameController.text;
                                    String password =
                                        controller.passwordController.text;
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await controller.login(username, password);
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.purple,
                                  ),
                                  child: Center(
                                    child: Visibility(
                                      visible: isLoading,
                                      child: CircularProgressIndicator(),
                                      replacement: Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Belum memiliki akun?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.REGISTER);
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
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

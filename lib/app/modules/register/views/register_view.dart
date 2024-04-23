import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool obsecureText = true;
    return Scaffold(
      backgroundColor: Color(0xff8ED6FF),
      body: Form(
          key: controller.formKey,
          child: Container(
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
                  elevation: 24,
                  margin: EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'REGISTER',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                controller: controller.usernameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username tidak boleh kosong";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                controller: controller.emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email tidak boleh kosong";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                controller: controller.passwordController,
                                obscureText: obsecureText,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password tidak boleh kosong";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Ulangi Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                controller:
                                    controller.confirmpasswordController,
                                obscureText: obsecureText,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password tidak sama!";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              Container(
                                margin: const EdgeInsets.only(bottom: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => controller.loading.value
                                          ? CircularProgressIndicator()
                                          : InkWell(
                                              onTap: () {
                                                if (controller
                                                    .formKey.currentState!
                                                    .validate()) {
                                                  controller.addRegister();
                                                }
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.purple,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'REGISTER',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            Get.toNamed(Routes.LOGIN);
                                          },
                                          child: Text(
                                            'Login',
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:easy_localization/easy_localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'usernameError'.tr;
    }

    if (value.trim().split(' ').length > 2) {
      return 'usernameSpaceError'.tr;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'passwordError'.tr;
    }

    if (value.trim().split(' ').length > 1) {
      return 'passwordSpaceError'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('loginPageTitle'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKfZS7sKX1MJ7WClhNt2EwP12GbFzpc-09wYP1_VPknMkG1v3JWS9o_WEBAlj0CrrqIy0&usqp=CAU',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'usernameLabel'.tr,
                    border: const OutlineInputBorder(),
                  ),
                  validator: _validateUsername,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'passwordLabel'.tr,
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'processingData'.tr,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'loginButton'.tr,
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

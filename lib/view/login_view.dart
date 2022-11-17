import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:using_mvvm_provider/view_model/auth_view_model.dart';
import 'package:using_mvvm_provider/utils/routes/route_names.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    emailController.dispose();
    paswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obscureText.dispose();
    return super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              focusNode: passwordFocusNode,
              onFieldSubmitted: (value) {
                // FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.changeFieldFocus(
                    context: context,
                    current: emailFocusNode,
                    next: passwordFocusNode);
              },
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.alternate_email,
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: obscureText,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return TextFormField(
                  controller: paswordController,
                  focusNode: passwordFocusNode,
                  obscureText: obscureText.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: 'Passward',
                    labelText: 'Passward',
                    prefixIcon: const Icon(
                      Icons.password_sharp,
                    ),
                    suffixIcon: InkWell(
                      child: obscureText.value
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                      onTap: () {
                        obscureText.value = !obscureText.value;
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please Enter a message', context);
                } else if (paswordController.text.isEmpty ||
                    paswordController.text.length < 8) {
                  Utils.toastMessage(
                      'Please Enter a passward of 8 or more characters');
                } else {
                  Map data = {
                    'email': emailController.text,
                    'password': paswordController.text.toString()
                  };

                  authViewModel.loginApi(data, context);
                  print('Data Saved to Api');
                }
              },
              child: authViewModel.loading
                  ? const CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                    )
                  : const Text('Log in '),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.signUp);
              },
              onHover: (value) {
                setState(() {
                  isHover = value;
                });
              },
              child: Text(
                'Don\'t have an account ?  Sign Up',
                style: TextStyle(color: isHover ? Colors.blue : Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

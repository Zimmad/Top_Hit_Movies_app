import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../utils/routes/route_names.dart';
import '../view_model/auth_view_model.dart';
import '../utils/utils.dart';

class SignUpSceen extends StatefulWidget {
  const SignUpSceen({Key? key}) : super(key: key);

  @override
  State<SignUpSceen> createState() => _SignUpSceenState();
}

class _SignUpSceenState extends State<SignUpSceen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier obscureText = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    bool isHovered = false;

    AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUP '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: emailController,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email_outlined)),
                onFieldSubmitted: (_) {
                  Utils.changeFieldFocus(
                      context: context,
                      current: emailFocusNode,
                      next: passwordFocusNode);
                }),
            ValueListenableBuilder(
              valueListenable: obscureText,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return TextFormField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  obscureText: obscureText.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: 'Passward',
                    labelText: 'Passward',
                    prefixIcon: const Icon(
                      Icons.password_outlined,
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
                  Utils.flushBarErrorMessage(
                      'Please Enter your user name', context);
                } else if (passwordController.text.isEmpty ||
                    passwordController.text.length < 8) {
                  Utils.toastMessage(
                      'Please Enter a passward of 8 or more characters');
                } else {
                  Map data = {
                    'email': emailController.text,
                    'password': passwordController.text.toString()
                  };

                  authViewModel.signUpApi(data, context);
                }
              },
              child: authViewModel.signUpLoading
                  ? const CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                    )
                  : const Text('Signed Up '),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Alredy have an account?  ',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteNames.logIn);
                  },
                  onHover: (value) {
                    setState(() {
                      isHovered = true;
                    });
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 16,
                        color: isHovered
                            ? Colors.blue
                            : Color.fromARGB(255, 96, 94, 217)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

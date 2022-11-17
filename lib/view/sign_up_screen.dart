import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:using_mvvm_provider/view_model/auth_view_model.dart';
import 'package:using_mvvm_provider/utils/utils.dart';

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
        children: [
          TextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
              ),
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
                    child: const Icon(Icons.visibility_off_outlined),
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
                print('Data Saved to Api');
              }
            },
            child: authViewModel.signUpLoading
                ? const CircularProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                  )
                : const Text('Signed Up '),
          ),
          const SizedBox(height: 40),
          InkWell(
            onHover: (value) {
              setState(() {
                isHovered = true;
              });
            },
            child: Text(
              'Alredy have an account? login',
              style: TextStyle(color: isHovered ? Colors.blue : Colors.white),
            ),
          )
        ],
      )),
    );
  }
}

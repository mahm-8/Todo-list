// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:todo/blocs/auth_bloc/auth_bloc_event.dart';
import 'package:todo/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:todo/extension/ext_string.dart';
import 'package:todo/screen/verification.dart';
import 'package:todo/widgets/button_widget.dart';
import 'package:todo/widgets/cust_field.dart';
import 'package:todo/widgets/gradient_text.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailKey = GlobalKey<FormState>();
  final userKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool display = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    "assets/todolist.png",
                    height: 200,
                  ),
                ),
                const GradientText(text: 'Sign Up'),
                const SizedBox(
                  height: 20,
                ),
                CustomField(
                  taskController: userController,
                  hintText: 'User name',
                  keyForm: userKey,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'enter name please';
                    }
                    return null;
                  },
                  line: 1,
                ),
                CustomField(
                  taskController: emailController,
                  hintText: 'email',
                  keyForm: emailKey,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'enter email please';
                    }
                    if (!val.isValidEmail) {
                      return 'email contain @ and .';
                    }
                    return null;
                  },
                  line: 1,
                ),
                CustomField(
                  taskController: passController,
                  hintText: 'password',
                  keyForm: passKey,
                  display: display,
                  pass: true,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'enter password please';
                    }
                    if (!val.isValidPassword) {
                      return 'upperCase ,lowerCase,number,(!@#*\$)';
                    }
                    return null;
                  },
                  onTap: () {
                    display = !display;
                    setState(() {});
                  },
                  line: 1,
                ),
                BlocConsumer<AuthBlocBloc, AuthBlocState>(
                  listener: (context, state) {
                    if (state is SignUpState) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OtpScreen(email: emailController.text),
                          ),
                          (route) => false);
                    } else if (state is ErrorState) {
                      Fluttertoast.showToast(
                        backgroundColor: Colors.black,
                        msg: state.msg,
                        gravity: ToastGravity.CENTER,
                      );
                    }
                  },
                  builder: (context, state) {
                    return ButtonWidget(
                      text: 'Sign Up',
                      onPressed: () {
                        context.read<AuthBlocBloc>().add(SignUpEvent(
                            userController.text,
                            emailController.text,
                            passController.text,
                            emailKey,
                            passKey,
                            userKey));
                      },
                    );
                  },
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
                          ),
                          (route) => false);
                    },
                    child: const Text('Login'))
              ],
            ),
          ),
        )),
      ),
    );
  }
}

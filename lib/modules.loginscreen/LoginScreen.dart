import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_screen/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var isPassword = true;
  var obsecureFlag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTextForm(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      onSubmit: () {
                        print('TextField is Submitted');
                      },
                      onChange: () {
                        print('TextField is Changed');
                      },
                      labelText: "Email Address",
                      prefixIcon: Icons.email,
                    onSuffixIconPressed: (){}
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextForm(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      isPassword: isPassword,
                      /*validate: (String value) {
                        if (value.isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },*/
                      onSubmit: () {
                        print('TextField is Submitted');
                      },
                      onChange: () {
                        print('TextField is Changed');
                      },
                      labelText: "Password",
                      prefixIcon: Icons.lock,
                      suffixIcon: obsecureFlag ? Icons.visibility : Icons.visibility_off,
                      onSuffixIconPressed: (){
                        setState((){
                          obsecureFlag = !obsecureFlag;
                        });
                    },
                    obSecureFlag: obsecureFlag
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState != null) {
                          if (formKey.currentState!.validate()) {}
                        }
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

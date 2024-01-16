import 'package:doctors/components/button.dart';
import 'package:doctors/utils/config.dart';
import 'package:flutter/material.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  //  String? emailValidator(String value) {
  //   Pattern pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value)) {
  //     return 'Email format is invalid';
  //   } else {
  //     return null;
  //   }
  // }

  //  String? pwdValidator(String value) {
  //   if (value.length < 8) {
  //     return 'Password must be longer than 8 characters';
  //   } else {
  //     return null;
  //   }
  // }

  final _formKey =GlobalKey<FormState>();
  final _emailController =TextEditingController();
  final _passController =TextEditingController();
  bool obsecurePass=true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
              
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outlined),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obsecurePass =!obsecurePass;
                    });
                  },
                  icon: obsecurePass ?
                      const Icon(Icons.visibility_off_outlined, color: Colors.black38,):
                  const Icon(Icons.visibility_off_outlined, color: Config.primaryColor,)
              )
            ),
          ),
          Config.spaceSmall,
          Button(
              width: double.infinity,
              title: 'Sign In',
              onPressed: (){
                // let's try sign in manually
                Navigator.of(context).pushNamed('main');
              },
              disable: false
          )
        ],
      ),
    );
  }
}

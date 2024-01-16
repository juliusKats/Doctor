import 'package:doctors/components/loginform.dart';
import 'package:doctors/components/socialicons.dart';
import 'package:doctors/utils/config.dart';
import 'package:doctors/utils/text.dart';
import 'package:flutter/material.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthState();
}

class _AuthState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.enText['welcome_text']!,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              Text(
                AppText.enText['signIn_text']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              // Login Components
              const LoginForm(),
              Config.spaceSmall,
              Center(
                child: TextButton(
                  onPressed: (){},
                  child:  Text(
                    AppText.enText['forgot_password']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            //   add social button sign in
              const Spacer(),
              Center(
                child:Text(
                  AppText.enText['social_login']!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color:Colors.grey,
                  ),
                ),
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  // social icons
                  SocialButton(social: 'google'),
                  SocialButton(social: 'facebook'),
                ],
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(
              AppText.enText['signUp_text']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color:Colors.grey,
                ),
              ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color:Colors.grey,
                    ),
                  ),

                ],
              )
            ],
          ),
        ),

      )
    );
  }
}

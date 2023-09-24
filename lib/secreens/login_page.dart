import 'package:flutter/material.dart';
import 'package:log_in/widgets/forgot_password_text_button.dart';
import 'package:log_in/widgets/register_row.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';
import '../utils/snack_messages.dart';
import '../widgets/costum_text_field.dart';
import '../widgets/custom_button.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '  Sign In',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: _buildColumn(context),
        ),
      ),
    );
  }

  Widget _buildColumn(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          customTextField(
            title: 'Email',
            controller: _email,
            hint: 'Enter you valid email address',
          ),
          SizedBox(height: 10),
          customTextField(
            title: 'Password',
            controller: _password,
            hint: 'Enter your secured password',
          ),
          SizedBox(height: 20),
          Consumer<AuthenticationProvider>(builder: (context, auth, child) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              if (auth.resMessage != '') {
                showMessage(message: auth.resMessage, context: context);

                auth.clear();
              }
            });
            return customButton(
              text: 'Login',
              tap: () {
                if (_email.text.isEmpty || _password.text.isEmpty) {
                  showMessage(
                      message: "All fields are required", context: context);
                } else {
                  auth.loginUser(
                      context: context,
                      email: _email.text.trim(),
                      password: _password.text.trim());
                }
              },
              context: context,
              //status: auth.isLoading,
            );
          }),
          SizedBox(height: 10),
          const ForgotPasswordTextButton(),
          const RegisterRow(),
        ],
      ),
    );
  }
}

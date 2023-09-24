//import 'package:AliDantel.com/routes/app_router.gr.dart';
import 'package:log_in/utils/localization/app_local.dart';
import 'package:log_in/utils/theme/ad_colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         'Do not have an account? ',
          style: const TextStyle(color: ADColors.darkAcColor),
        ),
        TextButton(
          onPressed: null,//() => context.router.push(Register()),
          child: Text(
            'register',
            style: const TextStyle(color: ADColors.accentColor),
          ),
        ),
      ],
    );
  }
}

import 'package:log_in/utils/localization/app_local.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../utils/theme/ad_colors.dart';
//import 'package:AliDantel.com/routes/app_router.gr.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => null,// context.router.push(ForgotPassword()),
      child: Text(
        'password Forget',
        style: const TextStyle(
            color: ADColors.darkAcColor, decoration: TextDecoration.underline),
      ),
    );
  }
}

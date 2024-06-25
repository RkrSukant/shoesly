import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';

@RoutePage()
class InternetErrorScreen extends StatelessWidget {
  const InternetErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.icNoInternet,
              color: AppColors.error500_FF7144,
            ),
            addVerticalSpace(Dimens.spacing_32),
            const Text(Strings.noInternetMsg, style: text_error500_headline400_w600_16,)
          ],
        ),
      ),
    );
  }
}

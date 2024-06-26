import 'package:flutter/material.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/enums/icon_location.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final bool disable;
  final IconLocation iconLocation;
  final String icon;
  final bool hasPadding;

  final VoidCallback onPress;

  const SecondaryButton(
      {super.key,
      required this.text,
      this.buttonColor = AppColors.neutral500_101010,
      this.disable = false,
      this.icon = "",
      this.hasPadding = true,
      this.iconLocation = IconLocation.none,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.spacing_50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            elevation: Dimens.spacing_0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.spacing_50),
            ),
            side:
                const BorderSide(color: AppColors.grey_767676, width: Dimens.spacing_1)),
        onPressed: disable ? null : onPress,
        child: Padding(
          padding: (hasPadding)? const EdgeInsets.symmetric(horizontal: Dimens.spacing_10) : EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: (iconLocation == IconLocation.start),
                  child: Image.asset(
                    icon,
                    height: Dimens.spacing_20,
                  )),
              Visibility(
                  visible: (iconLocation == IconLocation.start),
                  child: addHorizontalSpace(Dimens.spacing_8)),
              Text(
                text,
                style: text_headline300_w700_14,
              ),
              Visibility(
                  visible: (iconLocation == IconLocation.end),
                  child: addHorizontalSpace(Dimens.spacing_8)),
              Visibility(
                  visible: (iconLocation == IconLocation.end),
                  child: Image.asset(
                    icon,
                    height: Dimens.spacing_20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/enums/icon_location.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final bool disable;
  final bool hasIcon;
  final IconLocation iconLocation;
  final String icon;

  final VoidCallback onPress;

  const PrimaryButton(
      {super.key,
      required this.text,
      this.buttonColor = AppColors.neutral500_101010,
      this.disable = false,
      this.hasIcon = false,
      this.icon = "",
      this.iconLocation = IconLocation.start,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.spacing_50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: disable ? AppColors.grey_989898 : buttonColor,
          elevation: Dimens.spacing_0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.spacing_12)),
        ),
        onPressed: disable ? null : onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing_20),
          child: Row(
            children: [
              Visibility(
                  visible: (hasIcon && iconLocation == IconLocation.start),
                  child: Image.asset(
                    icon,
                    height: Dimens.spacing_20,
                  )),
              Visibility(
                  visible: (hasIcon && iconLocation == IconLocation.start),
                  child: addHorizontalSpace(Dimens.spacing_8)),
              Text(
                text,
                style: text_neutral0_headline300_w700_14,
              ),
              Visibility(
                  visible: (hasIcon && iconLocation == IconLocation.end),
                  child: addHorizontalSpace(Dimens.spacing_8)),
              Visibility(
                  visible: (hasIcon && iconLocation == IconLocation.end),
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

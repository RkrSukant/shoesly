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
  final IconLocation iconLocation;
  final String icon;
  final bool iconNotification;
  final bool hasPadding;

  final VoidCallback onPress;

  const PrimaryButton(
      {super.key,
      required this.text,
      this.buttonColor = AppColors.neutral500_101010,
      this.disable = false,
      this.icon = "",
      this.hasPadding = true,
      this.iconLocation = IconLocation.none,
      this.iconNotification = false,
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
              borderRadius: BorderRadius.circular(Dimens.spacing_50)),
        ),
        onPressed: disable ? null : onPress,
        child: Padding(
          padding: (hasPadding)? const EdgeInsets.symmetric(horizontal: Dimens.spacing_10) : EdgeInsets.zero,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: (iconLocation == IconLocation.start), child: _iconWidget()),
              Visibility(
                  visible: (iconLocation == IconLocation.start),
                  child: addHorizontalSpace(Dimens.spacing_8)),
              Text(
                text.toUpperCase(),
                style: text_neutral0_headline300_w700_14,
              ),
              Visibility(
                  visible: (iconLocation == IconLocation.end),
                  child: addHorizontalSpace(Dimens.spacing_8)),
              Visibility(
                  visible: (iconLocation == IconLocation.end), child: _iconWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconWidget() {
    return SizedBox(
      height: Dimens.spacing_20,
      width: Dimens.spacing_20,
      child: Stack(
        children: [
          Image.asset(
            icon,
          ),
          Visibility(
            visible: iconNotification,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: Dimens.spacing_4),
                child: Container(
                  height: Dimens.spacing_8,
                  width: Dimens.spacing_8,
                  decoration: const BoxDecoration(
                      color: AppColors.error500_FF7144,
                      borderRadius: BorderRadius.all(Radius.circular(Dimens.spacing_10))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

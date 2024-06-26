import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sukant_shoesly/routes/app_routes.gr.dart';
import 'package:sukant_shoesly/routes/route_utils.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/enums/toast_type_enum.dart';
import 'package:sukant_shoesly/shared/utils/extensions.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';
import 'package:sukant_shoesly/shared/widgets/secondary_button.dart';
import 'package:sukant_shoesly/shared/widgets/primary_button.dart';

void addedToCartBottomSheet(
  BuildContext context,
  int qty,
) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (buildContext, setState) {
          return Padding(
              padding: const EdgeInsets.all(Dimens.spacing_30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Image.asset(
                    ImageConstants.icTickCircle,
                    height: Dimens.spacing_100,
                  )),
                  addVerticalSpace(Dimens.spacing_20),
                  const Text(
                    Strings.addedToCart,
                    style: text_headline700_w600_24,
                  ),
                  addVerticalSpace(Dimens.spacing_5),
                  Text(
                    "$qty Items Total",
                    style: text_neutral400_body200_w400_14,
                  ),
                  addVerticalSpace(Dimens.spacing_30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SecondaryButton(
                          text: Strings.backExplore,
                          hasPadding: false,
                          onPress: () {
                            Navigator.pop(context);
                            context.goBackUntil(const DiscoverRoute());
                          }),
                      PrimaryButton(
                        text: Strings.toCart,
                        onPress: () {
                          Navigator.pop(context);
                          context.replaceRoute(const CartRoute());
                        },
                      )
                    ],
                  ),
                  addVerticalSpace(Dimens.spacing_20)
                ],
              ));
        });
      });
}

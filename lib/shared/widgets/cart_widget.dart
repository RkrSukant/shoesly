import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sukant_shoesly/routes/app_routes.gr.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';

class CartWidget extends StatelessWidget {
  final bool hasNotification;

  const CartWidget({super.key, this.hasNotification = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimens.spacing_24),
      onTap: (){
        context.pushRoute(const CartRoute());
      },
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_4),
        child: SizedBox(
          height: Dimens.spacing_24,
          width: Dimens.spacing_24,
          child: Stack(
            children: [
              Image.asset(
                ImageConstants.icCart,
              ),
              Visibility(
                visible: hasNotification,
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
        ),
      ),
    );
  }
}

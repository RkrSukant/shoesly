import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/enums/toast_type_enum.dart';
import 'package:sukant_shoesly/shared/utils/extensions.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';
import 'package:sukant_shoesly/shared/widgets/added_to_cart_bottom_sheet.dart';
import 'package:sukant_shoesly/shared/widgets/primary_button.dart';

void addToCartBottomSheet(
  BuildContext context,
) {
  int qty = 1;
  TextEditingController _qtyController = TextEditingController();
  _qtyController.text = qty.toString();
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (buildContext, setState) {
          return Padding(
              padding: EdgeInsets.only(
                  left: Dimens.spacing_30,
                  right: Dimens.spacing_30,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: Dimens.spacing_10),
                        child: Container(
                          height: Dimens.spacing_4,
                          width: Dimens.spacing_48,
                          decoration: BoxDecoration(
                              color: AppColors.neutral200_E7E7E7,
                              borderRadius: BorderRadius.circular(Dimens.spacing_4)),
                        )),
                  ),
                  addVerticalSpace(Dimens.spacing_16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        Strings.addToCart,
                        style: text_headline600_w700_20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(Dimens.spacing_4),
                          child: Image.asset(
                            ImageConstants.icClose,
                            height: Dimens.spacing_18,
                          ),
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(Dimens.spacing_30),
                  const Text(
                    Strings.quantity,
                    style: text_headline300_w700_14,
                  ),
                  addVerticalSpace(Dimens.spacing_10),
                  TextField(
                    // style: text_body200_w400_14,
                    keyboardType: TextInputType.number,
                    controller: _qtyController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      int tempQty = int.parse(value);
                      if (tempQty > 0) {
                        qty = tempQty;
                        _qtyController.text = qty.toString();
                        setState(() {});
                      }
                    },

                    decoration: InputDecoration(
                      hintText: qty.toString(),
                      hintStyle: text_neutral400_body200_w400_14,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(Dimens.spacing_24),
                            onTap: () {
                              if (qty > 1) {
                                qty--;
                                _qtyController.text = qty.toString();
                                setState(() {});
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.spacing_4),
                              child: Image.asset(
                                ImageConstants.icMinus,
                                color: (qty > 1)
                                    ? AppColors.neutral500_101010
                                    : AppColors.neutral300_B7B7B7,
                                height: Dimens.spacing_24,
                              ),
                            ),
                          ),
                          addHorizontalSpace(Dimens.spacing_12),
                          InkWell(
                            borderRadius: BorderRadius.circular(Dimens.spacing_24),
                            onTap: () {
                              qty++;
                              _qtyController.text = qty.toString();
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.spacing_4),
                              child: Image.asset(
                                ImageConstants.icPlus,
                                height: Dimens.spacing_24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.neutral500_101010, width: 1.0),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.neutral500_101010, width: 2.0),
                      ),
                    ),
                  ),
                  addVerticalSpace(Dimens.spacing_30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            Strings.price,
                            style: text_neutral300_body100_w400_12,
                          ),
                          addVerticalSpace(Dimens.spacing_5),
                          const Text(
                            "\$250",
                            style: text_headline600_w700_20,
                          ),
                        ],
                      ),
                      PrimaryButton(
                          text: Strings.addToCart,
                          onPress: () {
                            Navigator.pop(context);
                            addedToCartBottomSheet(context, qty);
                          })
                    ],
                  ),
                  addVerticalSpace(Dimens.spacing_20)
                ],
              ));
        });
      });
}

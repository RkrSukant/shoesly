import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sukant_shoesly/routes/app_routes.gr.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';
import 'package:sukant_shoesly/shared/widgets/primary_button.dart';
import 'package:sukant_shoesly/shared/widgets/shoesly_appbar.dart';

@RoutePage()
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShoeslyAppbar(
        title: Strings.cart,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              addVerticalSpace(Dimens.spacing_30),
              ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return addVerticalSpace(Dimens.spacing_30);
                },
                itemBuilder: (context, index) {
                  return _cartListItemWidget();
                },
              ),
            ],
          ),
          _checkoutWidget()
        ],
      ),
    );
  }

  Widget _checkoutWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: AppColors.neutral0_FFFFFF,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Dimens.spacing_20, horizontal: Dimens.spacing_30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Strings.grandTotal,
                    style: text_neutral300_body100_w400_12,
                  ),
                  addVerticalSpace(Dimens.spacing_5),
                  const Text(
                    "\$750.00",
                    style: text_headline600_w700_20,
                  ),
                ],
              ),
              PrimaryButton(
                  text: Strings.checkout,
                  onPress: () {
                    context.pushRoute(const OrderSummaryRoute());
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartListItemWidget() {
    int qty =1;
    return Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  //todo delete
                },
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(Dimens.spacing_20)),
                      color: AppColors.error500_FF7144),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: Dimens.spacing_4),
                    child: Image.asset(
                      ImageConstants.icDelete,
                      height: Dimens.spacing_24,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing_30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimens.spacing_100,
                width: Dimens.spacing_100,
                decoration: BoxDecoration(
                    color: AppColors.grey_F3F3F3,
                    borderRadius: BorderRadius.circular(Dimens.spacing_12)),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.spacing_10),
                      child: Image.asset(
                                        ImageConstants.icAdidas,
                                      ),
                    )),
              ),
              addHorizontalSpace(Dimens.spacing_15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jordan 1 Retro High Tie Dye", style: text_headline400_w600_16,),
                    addVerticalSpace(Dimens.spacing_5),
                    Text("Nike . Green Goblin . 42", style: text_body100_w400_12,),
                    addVerticalSpace(Dimens.spacing_10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$250.00", style: text_headline300_w700_14,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(Dimens.spacing_24),
                              onTap: () {
                                if (qty > 1) {
                                  qty--;
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
                            addHorizontalSpace(Dimens.spacing_10),
                            Text(qty.toString(), style: text_headline300_w700_14,),
                            addHorizontalSpace(Dimens.spacing_10),
                            InkWell(
                              borderRadius: BorderRadius.circular(Dimens.spacing_24),
                              onTap: () {
                                qty++;
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
                        )
                      ],
                    )
                
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

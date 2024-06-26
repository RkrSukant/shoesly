import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/enums/toast_type_enum.dart';
import 'package:sukant_shoesly/shared/utils/extensions.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';
import 'package:sukant_shoesly/shared/widgets/primary_button.dart';
import 'package:sukant_shoesly/shared/widgets/shoesly_appbar.dart';

@RoutePage()
class OrderSummaryScreen extends ConsumerStatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  ConsumerState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends ConsumerState<OrderSummaryScreen> {

  String _paymentMethod = "Credit Card";
  String _location = "Semarang, Indonesia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShoeslyAppbar(
        title: Strings.orderSummary,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.spacing_30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _informationWidget(),
                  addVerticalSpace(Dimens.spacing_30),
                  _orderDetailWidget(),
                  addVerticalSpace(Dimens.spacing_30),
                  _paymentDetailWidget()
                ],
              ),
            ),
          ),
          _paymentWidget()
        ],
      ),
    );
  }

  Widget _informationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(Strings.information, style: text_headline500_w700_18,),
        addVerticalSpace(Dimens.spacing_20),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(Strings.paymentMethod, style: text_headline300_w700_14,),
                  addVerticalSpace(Dimens.spacing_5),
                  Text(_paymentMethod, style: text_neutral400_body200_w400_14,)
                ],
              ),
              Image.asset(ImageConstants.icAngleArrowRight, height: Dimens.spacing_24,)
            ],
          ),
        ),
        addVerticalSpace(Dimens.spacing_20),
        const Divider(
          height: Dimens.spacing_1,
          color: AppColors.neutral100_F3F3F3,
        ),
        addVerticalSpace(Dimens.spacing_20),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(Strings.location, style: text_headline300_w700_14,),
                  addVerticalSpace(Dimens.spacing_5),
                  Text(_location, style: text_neutral400_body200_w400_14,)
                ],
              ),
              Image.asset(ImageConstants.icAngleArrowRight, height: Dimens.spacing_24,)
            ],
          ),
        ),
      ],
    );
  }

  Widget _orderDetailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(Strings.orderDetail, style: text_headline500_w700_18,),
        addVerticalSpace(Dimens.spacing_20),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context, index) {
            return addVerticalSpace(Dimens.spacing_20);
          },
          itemBuilder: (context, index) {
            return _orderDetailItemWidget();
          },
        )
      ],
    );
  }

  Widget _paymentDetailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(Strings.paymentDetail, style: text_headline500_w700_18,),
        addVerticalSpace(Dimens.spacing_20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.subTotal, style: text_neutral400_body200_w400_14,),
            Text("\$705.00", style: text_headline400_w600_16,)
          ],
        ),
        addVerticalSpace(Dimens.spacing_20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.shipping, style: text_neutral400_body200_w400_14,),
            Text("\$20.00", style: text_headline400_w600_16,)
          ],
        ),
        addVerticalSpace(Dimens.spacing_20),
        const Divider(
          height: Dimens.spacing_1,
          color: AppColors.neutral100_F3F3F3,
        ),
        addVerticalSpace(Dimens.spacing_20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.totalOrder, style: text_neutral400_body200_w400_14,),
            Text("\$725.00", style: text_headline500_w700_18,)
          ],
        ),
      ],
    );
  }

  Widget _orderDetailItemWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jordan 1 Retro High Tie Dye", style: text_headline400_w600_16,),
        addVerticalSpace(Dimens.spacing_10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Nike . Red Grey . 40 . Qty 1", style: text_neutral400_body200_w400_14,),
            Text("\$235.00", style: text_headline300_w700_14,)
          ],
        )
      ],
    );
  }

  Widget _paymentWidget() {
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
                  text: Strings.payment,
                  onPress: () {
                    context.showToast("Payment in not ready yet!", ToastType.info);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

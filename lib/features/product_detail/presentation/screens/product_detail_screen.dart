import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_shoesly/features/product_detail/data/model/color_model.dart';
import 'package:sukant_shoesly/shared/models/ReviewListItemModel.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';
import 'package:sukant_shoesly/shared/widgets/secondary_button.dart';
import 'package:sukant_shoesly/shared/widgets/add_to_cart_bottom_sheet.dart';
import 'package:sukant_shoesly/shared/widgets/cart_widget.dart';
import 'package:sukant_shoesly/shared/widgets/primary_button.dart';
import 'package:sukant_shoesly/shared/widgets/review_list_item_widget.dart';
import 'package:sukant_shoesly/shared/widgets/shoesly_appbar.dart';

@RoutePage()
class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  ConsumerState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  CarouselController _carouselController = CarouselController();
  int _currentImage = 0;
  int _selectedColor = 0;
  double _selectedSize = 0;

  List<String> images = [
    ImageConstants.icAdidas,
    ImageConstants.icPuma,
    ImageConstants.icNike,
    ImageConstants.icReebok,
  ];

  List<ColorModel> colors = [
    ColorModel(colorName: "White", colorCode: "#FFFFFF"),
    ColorModel(colorName: "Black", colorCode: "#101010"),
    ColorModel(colorName: "Ocean", colorCode: "#648B8B"),
    ColorModel(colorName: "Blue", colorCode: "#2952CC"),
  ];

  List<double> sizes = [39, 39.5, 40, 40.5, 41];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ShoeslyAppbar(
        actionIcons: [CartWidget()],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing_30),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: Dimens.spacing_15),
              child: Column(
                children: [
                  _productImageWidget(),
                  addVerticalSpace(Dimens.spacing_30),
                  _productDescWidget(),
                  addVerticalSpace(Dimens.spacing_30),
                  _reviewListWidget()
                ],
              ),
            ),
          ),
          _addToCartWidget()
        ],
      ),
    );
  }

  Widget _productImageWidget() {
    return Container(
      height: (MediaQuery.of(context).size.width - Dimens.spacing_60),
      decoration: BoxDecoration(
        color: AppColors.grey_F3F3F3,
        borderRadius: BorderRadius.circular(Dimens.spacing_20),
      ),
      child: Stack(
        children: [
          Center(
            child: CarouselSlider(
                carouselController: _carouselController,
                items: images.map((image) => Image.asset(image)).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    _currentImage = index;
                    setState(() {});
                  },
                  enableInfiniteScroll: true,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.spacing_10, horizontal: Dimens.spacing_20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Dimens.spacing_8,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _currentImage = index;
                            _carouselController.animateToPage(index);
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              width: Dimens.spacing_8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimens.spacing_10),
                                  color: (index == _currentImage)
                                      ? AppColors.neutral500_101010
                                      : AppColors.neutral300_B7B7B7),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: Dimens.spacing_40,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0_FFFFFF,
                      borderRadius: BorderRadius.circular(Dimens.spacing_100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.spacing_10),
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return addHorizontalSpace(Dimens.spacing_10);
                        },
                        itemBuilder: (context, index) {
                          Color convertedColor = hexToColorNew(colors[index].colorCode);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            child: Container(
                              height: Dimens.spacing_20,
                              width: Dimens.spacing_20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: Dimens.spacing_1,
                                      color: AppColors.neutral200_E7E7E7),
                                  color: convertedColor,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.spacing_100)),
                              child: Center(
                                child: Visibility(
                                  visible: (_selectedColor == index),
                                  child: Image.asset(
                                    ImageConstants.icTick,
                                    width: Dimens.spacing_10,
                                    color: (convertedColor.computeLuminance() > 0.5)
                                        ? AppColors.neutral500_101010
                                        : AppColors.neutral0_FFFFFF,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _productDescWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Jordan 1 Retro High Tie Dye",
          style: text_headline600_w700_20,
        ),
        addVerticalSpace(Dimens.spacing_10),
        Row(
          children: [
            SizedBox(
              height: Dimens.spacing_12,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Image.asset(ImageConstants.icStar,
                      color:
                          (index < 3) ? AppColors.yellow_FCD240 : AppColors.grey_F3F3F3);
                },
              ),
            ),
            addHorizontalSpace(Dimens.spacing_5),
            const Text(
              "${4.5}",
              style: text_headline200_w700_12,
            ),
            addHorizontalSpace(Dimens.spacing_5),
            const Text(
              "(${1000} Reviews)",
              style: text_neutral300_body10_w400_12,
            )
          ],
        ),
        addVerticalSpace(Dimens.spacing_30),
        _sizeOptionWidget(),
        addVerticalSpace(Dimens.spacing_30),
        const Text(
          Strings.description,
          style: text_headline400_w600_16,
        ),
        addVerticalSpace(Dimens.spacing_10),
        Text(
          "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair.",
          style: text_neutral400_body200_w400_14,
        )
      ],
    );
  }

  Widget _sizeOptionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Strings.size,
          style: text_headline400_w600_16,
        ),
        addVerticalSpace(Dimens.spacing_10),
        SizedBox(
          height: Dimens.spacing_40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: sizes.length,
            separatorBuilder: (context, index) {
              return addHorizontalSpace(Dimens.spacing_15);
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedSize = sizes[index];
                  });
                },
                child: Container(
                  height: Dimens.spacing_40,
                  width: Dimens.spacing_40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.spacing_40),
                      color: (_selectedSize == sizes[index])
                          ? AppColors.neutral500_101010
                          : null,
                      border: Border.all(
                          color: AppColors.neutral200_E7E7E7, width: Dimens.spacing_1)),
                  child: Center(
                      child: Text(
                    sizes[index].toString(),
                    style: (_selectedSize == sizes[index])
                        ? text_neutral0_headline300_w700_14
                        : text_neutral400_headline300_w700_14,
                  )),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _reviewListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "${Strings.review} (${1000})",
          style: text_headline400_w600_16,
        ),
        addVerticalSpace(Dimens.spacing_10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context, index) {
            return addVerticalSpace(Dimens.spacing_30);
          },
          itemBuilder: (context, index) {
            return ReviewListItemWidget(
                review: ReviewListItemModel(
                    reviewerName: "Nolan Carder",
                    rating: 4,
                    image: ImageConstants.shoeslyIcon,
                    date: "25-6-2024",
                    remarks:
                        "Perfect for keeping your feet dry and warm in damp conditions."));
          },
        ),
        addVerticalSpace(Dimens.spacing_30),
        SecondaryButton(text: Strings.seeAllReviews.toUpperCase(), onPress: () {})
      ],
    );
  }

  Widget _addToCartWidget() {
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
              PrimaryButton(text: Strings.addToCart, onPress: () {
                addToCartBottomSheet(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}

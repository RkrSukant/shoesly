import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_shoesly/features/discover/data/model/discover_brand_model.dart';
import 'package:sukant_shoesly/features/discover/data/model/discover_product_model.dart';
import 'package:sukant_shoesly/routes/app_routes.gr.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/enums/icon_location.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';
import 'package:sukant_shoesly/shared/widgets/cart_widget.dart';
import 'package:sukant_shoesly/shared/widgets/primary_button.dart';

@RoutePage()
class DiscoverScreen extends ConsumerStatefulWidget {
  const DiscoverScreen({super.key});

  @override
  ConsumerState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  List<DiscoverBrandModel> brands = [
    DiscoverBrandModel(id: 0, brandName: "All", brandAlias: "ALL"),
    DiscoverBrandModel(id: 1, brandName: "Nike", brandAlias: "NIKE"),
    DiscoverBrandModel(id: 1, brandName: "Jordan", brandAlias: "JORDAN"),
    DiscoverBrandModel(id: 1, brandName: "Adidas", brandAlias: "ADIDAS"),
    DiscoverBrandModel(id: 1, brandName: "Reebok", brandAlias: "REEBOK")
  ];

  DiscoverBrandModel? selectedBrand;

  @override
  void initState() {
    super.initState();
    selectedBrand = brands.first;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(Dimens.spacing_30),
              Padding(
                padding: const EdgeInsets.all(Dimens.spacing_30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      Strings.discover,
                      style: text_headline700_w700_30,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(Dimens.spacing_4),
                          child: CartWidget(),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: Dimens.spacing_30,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing_30),
                    itemBuilder: (context, index) {
                      return _brandListItemWidget(index);
                    },
                    separatorBuilder: (context, index) {
                      return addHorizontalSpace(Dimens.spacing_12);
                    },
                    itemCount: brands.length),
              ),
              _productGridWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Dimens.spacing_24),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                  onPress: () {},
                  text: Strings.filter,
                  icon: ImageConstants.icFilter,
                  iconLocation: IconLocation.start,
                )),
          )
        ],
      ),
    ));
  }

  Widget _brandListItemWidget(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedBrand = brands[index];
        });
      },
      radius: Dimens.spacing_4,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_4),
        child: Text(
          brands[index].brandName,
          style: (brands[index] == selectedBrand)
              ? text_headline600_w700_20
              : text_neutral300_headline600_w700_20,
        ),
      ),
    );
  }

  Widget _productGridWidget() {
    double widgetWidth = MediaQuery.of(context).size.width - Dimens.spacing_75;
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(
                top: Dimens.spacing_30,
                right: Dimens.spacing_30,
                left: Dimens.spacing_30),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Dimens.spacing_15,
                mainAxisSpacing: Dimens.spacing_30,
                childAspectRatio: widgetWidth / 450,
              ),
              itemBuilder: (context, index) {
                return _productGridItemWidget(DiscoverProductModel(
                    id: 1,
                    productName: "Jordan 1 Retro High Tie Dye",
                    reviewCount: 1045,
                    rating: 4.5,
                    price: 235.0,
                    image: ImageConstants.appIcon,
                    brand: "Nike"));
              },
            )));
  }

  Widget _productGridItemWidget(DiscoverProductModel product) {
    return InkWell(
      onTap:(){
        context.pushRoute(ProductDetailRoute());
      },
      borderRadius: const BorderRadius.all(Radius.circular(Dimens.spacing_20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimens.spacing_20)),
              color: AppColors.grey_F3F3F3,
            ),
            height: Dimens.spacing_150,
            width: Dimens.spacing_150,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.spacing_15),
              child: Stack(
                children: [
                  Center(child: Image.asset(ImageConstants.shoeslyIcon)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      ImageConstants.icNike,
                      color: AppColors.neutral300_B7B7B7,
                      height: Dimens.spacing_24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          addVerticalSpace(Dimens.spacing_10),
          Text(
            product.productName,
            style: text_body100_w400_12,
            overflow: TextOverflow.ellipsis,
          ),
          addVerticalSpace(Dimens.spacing_5),
          Row(
            children: [
              Image.asset(
                ImageConstants.icStar,
                height: Dimens.spacing_10,
              ),
              addHorizontalSpace(Dimens.spacing_6),
              Text(
                product.rating.toStringAsFixed(1),
                style: text_headline200_w700_12,
              ),
              addHorizontalSpace(Dimens.spacing_5),
              Text(
                "(${product.reviewCount} Reviews)",
                style: text_neutral300_body10_w400_12,
              )
            ],
          ),
          Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: text_headline300_w700_14,
          )
        ],
      ),
    );
  }
}

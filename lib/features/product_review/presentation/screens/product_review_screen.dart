import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_shoesly/features/product_review/data/model/rating_model.dart';
import 'package:sukant_shoesly/shared/models/ReviewListItemModel.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/extensions.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';
import 'package:sukant_shoesly/shared/widgets/review_list_item_widget.dart';
import 'package:sukant_shoesly/shared/widgets/shoesly_appbar.dart';

@RoutePage()
class ProductReviewScreen extends ConsumerStatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  ConsumerState createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends ConsumerState<ProductReviewScreen> {
  String _selectedRating = "All";

  List<ReviewListItemModel> reviews = [
    ReviewListItemModel(
        reviewerName: "Nolan Carder",
        rating: 5,
        image: ImageConstants.icAvatarPlaceholder,
        date: "26-6-2024",
        remarks: "Perfect for keeping your feet dry and warm in damp conditions."),
    ReviewListItemModel(
        reviewerName: "Nolan Carder",
        rating: 4,
        image: ImageConstants.icAvatarPlaceholder,
        date: "26-6-2024",
        remarks: "Perfect for keeping your feet dry and warm in damp conditions."),
    ReviewListItemModel(
        reviewerName: "Nolan Carder",
        rating: 5,
        image: ImageConstants.icAvatarPlaceholder,
        date: "26-6-2024",
        remarks: "Perfect for keeping your feet dry and warm in damp conditions."),
    ReviewListItemModel(
        reviewerName: "Nolan Carder",
        rating: 3,
        image: ImageConstants.icAvatarPlaceholder,
        date: "26-6-2024",
        remarks: "Perfect for keeping your feet dry and warm in damp conditions."),
    ReviewListItemModel(
        reviewerName: "Nolan Carder",
        rating: 5,
        image: ImageConstants.icAvatarPlaceholder,
        date: "26-6-2024",
        remarks: "Perfect for keeping your feet dry and warm in damp conditions."),
    ReviewListItemModel(
        reviewerName: "Nolan Carder",
        rating: 5,
        image: ImageConstants.icAvatarPlaceholder,
        date: "26-6-2024",
        remarks: "Perfect for keeping your feet dry and warm in damp conditions."),
  ];
  List<ReviewListItemModel> tempReviews = [];

  @override
  void initState() {
    super.initState();
    tempReviews = reviews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoeslyAppbar(
        title: "Review (1045)",
        actionIcons: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageConstants.icStar,
                color: AppColors.yellow_FCD240,
                height: Dimens.spacing_20,
              ),
              const Text(
                "4.5",
                style: text_headline300_w700_14,
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: Dimens.spacing_30,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing_30),
                itemBuilder: (context, index) {
                  return _ratingsItemWidget(index);
                },
                separatorBuilder: (context, index) {
                  return addHorizontalSpace(Dimens.spacing_12);
                },
                itemCount: 6),
          ),
          addVerticalSpace(Dimens.spacing_10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing_30),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: Dimens.spacing_30),
                shrinkWrap: true,
                itemCount: tempReviews.length,
                separatorBuilder: (context, index) {
                  return addVerticalSpace(Dimens.spacing_30);
                },
                itemBuilder: (context, index) {
                  return ReviewListItemWidget(review: tempReviews[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _ratingsItemWidget(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedRating = (index == 0) ? "All" : "$index";
          tempReviews = reviews.where((review) {
            if (_selectedRating == "All") {
              return true;
            }
            return ((review.rating == 0) ? "All" : "${review.rating}") == _selectedRating;
          }).toList();
        });
      },
      radius: Dimens.spacing_4,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_4),
        child: Text(
          (index == 0) ? "All" : "Star".pluralizeWithLength(index),
          style: (_selectedRating == index.toString() ||
                  (index == 0 && _selectedRating == "All"))
              ? text_headline600_w700_20
              : text_neutral300_headline600_w700_20,
        ),
      ),
    );
  }
}

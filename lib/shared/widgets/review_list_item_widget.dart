import 'package:flutter/material.dart';
import 'package:sukant_shoesly/shared/models/ReviewListItemModel.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';

class ReviewListItemWidget extends StatelessWidget {
  final ReviewListItemModel review;

  const ReviewListItemWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.spacing_40),
            child: Image.asset(
              ImageConstants.icAvatarPlaceholder,
              height: Dimens.spacing_40,
              width: Dimens.spacing_40,
            )),
        addHorizontalSpace(Dimens.spacing_15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: Dimens.spacing_4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.reviewerName,
                      style: text_headline300_w700_14,
                    ),
                    Text(
                      getDays(),
                      style: text_neutral300_body100_w400_12,
                    )
                  ],
                ),
                addVerticalSpace(Dimens.spacing_5),
                SizedBox(
                  height: Dimens.spacing_12,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Image.asset(ImageConstants.icStar,
                          color: (index < review.rating)
                              ? AppColors.yellow_FCD240
                              : AppColors.grey_F3F3F3);
                    },
                  ),
                ),
                addVerticalSpace(Dimens.spacing_10),
                Text(
                  review.remarks,
                  style: text_body100_w400_12,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  String getDays() {
    int days = getTotalNumberOfDays(review.date);
    switch (days) {
      case 0:
        return Strings.today;
      case 1:
        return Strings.yesterday;
      default:
        return "$days Days ago";
    }
  }
}

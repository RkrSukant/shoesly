import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/enums/toast_type_enum.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';

//Extension on Iterables to group them
extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
          (Map<K, List<E>> map, E element) =>
      map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

//Extension on BuildContext to showToast messages
extension ContextExtensions on BuildContext {
  void showToast(String title, ToastType type) {
    Color activeColor = AppColors.neutral500_101010;
    if (type == ToastType.success) {
      activeColor = AppColors.success500_89D860;
    } else if (type == ToastType.info) {
      activeColor = AppColors.info500_00BAFB;
    } else if (type == ToastType.warning) {
      activeColor = AppColors.warning500_F1E43A;
    } else {
      activeColor = AppColors.error500_FF7144;
    }
    var fToast = FToast();
    fToast.init(this);
    return fToast.showToast(
        gravity: ToastGravity.TOP,
        child: Container(
          margin: const EdgeInsets.only(bottom: Dimens.spacing_0),
          height: Dimens.spacing_40,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          decoration: BoxDecoration(
            border: Border.all(color: activeColor),
            borderRadius: BorderRadius.circular(25.0),
            color: addWhite(activeColor, 0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.spacing_2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  type == ToastType.success ? Icons.check_circle : Icons.info,
                  color: activeColor,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Flexible(
                  child: Text(
                    title,
                    style: text_body200_w400_14, //todo change
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


extension StringExtensions on String {
  String toCapitalCase() {
    if (isEmpty) {
      return this;
    }

    return split(' ').map((word) {
      if (word.isEmpty) {
        return word;
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
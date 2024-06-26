import 'package:flutter/material.dart';
import 'package:sukant_shoesly/routes/route_utils.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';

class ShoeslyAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function? onBackPressed;
  final Widget? trailingIcon;
  final List<Widget> actionIcons;

  const ShoeslyAppbar(
      {super.key, this.title = "", this.onBackPressed, this.trailingIcon, this.actionIcons = const []})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  State<ShoeslyAppbar> createState() => _ShoeslyAppbarState();

  @override
  final Size preferredSize;
}

class _ShoeslyAppbarState extends State<ShoeslyAppbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing_30),
      child: AppBar(
        leadingWidth: Dimens.spacing_30,
          leading: InkWell(
            onTap: () {
              if (widget.onBackPressed == null) {
                context.goBack();
              } else {
                widget.onBackPressed;
              }
            },
            child: Image.asset(ImageConstants.icArrowLeft),
          ),
          centerTitle: true,
          title: Text(
            widget.title,
            style: text_headline400_w600_16,
          ),
          actions: widget.actionIcons,
      ),
    );
  }
}

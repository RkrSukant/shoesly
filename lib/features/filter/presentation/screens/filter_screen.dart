import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/widgets/shoesly_appbar.dart';

@RoutePage()
class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoeslyAppbar(
        title: Strings.filter,
      ),
    );
  }
}

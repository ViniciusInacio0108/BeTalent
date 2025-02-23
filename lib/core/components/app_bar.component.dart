import 'package:auto_size_text/auto_size_text.dart';
import 'package:betalent/core/style_guide/assets_urls.dart';
import 'package:betalent/core/style_guide/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: BeTalentColors.white.withOpacity(.95),
      surfaceTintColor: BeTalentColors.white.withOpacity(.95),
      elevation: 0,
      pinned: true,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: AutoSizeText(
              'CG',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(
            width: 36,
            child: Badge.count(
              backgroundColor: BeTalentColors.bluePrimary,
              textColor: BeTalentColors.white,
              offset: Offset(-5, 0),
              count: 2,
              child: SvgPicture.asset(
                BELL_ICON,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

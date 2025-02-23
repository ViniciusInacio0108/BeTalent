import 'package:auto_size_text/auto_size_text.dart';
import 'package:betalent/core/style_guide/assets_urls.dart';
import 'package:betalent/core/style_guide/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TableHeaderComponent extends StatelessWidget {
  const TableHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: BeTalentColors.blue10,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border.all(
          color: BeTalentColors.gray10,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          AutoSizeText(
            "Foto",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            width: 24,
          ),
          AutoSizeText(
            "Nome",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Spacer(),
          SvgPicture.asset(CIRCLE_ICON)
        ],
      ),
    );
  }
}

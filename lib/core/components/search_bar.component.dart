import 'package:betalent/core/style_guide/assets_urls.dart';
import 'package:betalent/core/style_guide/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarComponent extends StatelessWidget {
  final TextEditingController controller;

  const SearchBarComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: BeTalentColors.black,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 2.5),
          child: SvgPicture.asset(
            SEARCH_ICON,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
        hintText: 'Pesquisar',
        filled: true,
        hintStyle: Theme.of(context).textTheme.headlineSmall,
        fillColor: BeTalentColors.gray5,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: BeTalentColors.gray10,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: BeTalentColors.gray10,
            width: 1,
          ),
        ),
      ),
    );
  }
}

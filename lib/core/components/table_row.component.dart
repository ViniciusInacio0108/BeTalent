import 'package:auto_size_text/auto_size_text.dart';
import 'package:betalent/core/style_guide/assets_urls.dart';
import 'package:betalent/core/style_guide/style_guide.dart';
import 'package:betalent/core/utils/utils.dart';
import 'package:betalent/features/employee/employee.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TableRowComponent extends StatefulWidget {
  final EmployeeDomainModel employeeData;

  const TableRowComponent({super.key, required this.employeeData});

  @override
  State<TableRowComponent> createState() => _TableRowComponentState();
}

class _TableRowComponentState extends State<TableRowComponent> {
  bool _isOpen = false;

  void onTapTableRow() {
    if (mounted) {
      setState(() {
        _isOpen = !_isOpen;
      });
    }
  }

  Widget _buildDetails(String type, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DottedBorder(
        color: BeTalentColors.gray10,
        customPath: (size) => Path()
          ..moveTo(0, size.height) // Começa no canto inferior esquerdo
          ..lineTo(size.width, size.height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              type,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            AutoSizeText(
              value,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTapTableRow,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 13.5, 16, (_isOpen) ? 31 : 13.5),
        decoration: BoxDecoration(
          border: Border.all(
            color: BeTalentColors.gray10,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.employeeData.image),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: AutoSizeText(
                    widget.employeeData.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SvgPicture.asset((_isOpen) ? ARROW_DOWN_ICON : ARROW_UP_ICON),
              ],
            ),
            if (_isOpen)
              const SizedBox(
                height: 30,
              ),
            if (_isOpen) _buildDetails("Cargo", widget.employeeData.job),
            if (_isOpen)
              _buildDetails("Data de admissão",
                  StringFormatting.dateFormattingFromDatetimeString(widget.employeeData.admissionDate)),
            if (_isOpen) _buildDetails("Telefone", StringFormatting.phoneFormatting(widget.employeeData.phone)),
          ],
        ),
      ),
    );
  }
}

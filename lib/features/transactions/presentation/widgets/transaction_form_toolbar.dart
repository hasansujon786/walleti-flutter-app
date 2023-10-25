import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_colors.dart';
import 'tnx_date_picker.dart';

const btnText = AppColors.darkGreen;
const btnOutline = AppColors.extraLightGrey;

class TransactionFormToolBar extends StatelessWidget {
  const TransactionFormToolBar({
    super.key,
    required this.toggleNote,
    required this.isSaveBtnDisablled,
    required this.onSave,
    required this.onSelectNewDate,
  });

  final VoidCallback toggleNote;
  final bool isSaveBtnDisablled;
  final void Function(DateTime?) onSelectNewDate;
  final void Function(BuildContext context, WidgetRef ref) onSave;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ToolIconBtn(icon: Icons.note_add_outlined, onPressed: toggleNote),
          const SizedBox(width: 4),
          TnxDatePicker(onPick: onSelectNewDate),
          const Spacer(),
          ToolIconBtn(
            icon: Icons.send,
            onPressed: isSaveBtnDisablled ? null : () => onSave(context, ref),
          ),
        ],
      );
    });
  }
}

class ToolBtn extends StatelessWidget {
  const ToolBtn({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed
  });

  final String label;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // final primaryColor = Theme.of(context).primaryColor;
    final disableColor = Colors.grey.shade300;

    return TextButton.icon(
      label: Text(label, style: const TextStyle(color: btnText)),
      icon: Icon(icon, size: 20, color: btnText),
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: const MaterialStatePropertyAll(Size.fromHeight(38)),
        padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 10, right: 12)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: disableColor),
          ),
        ),
      ),
    );
  }
}

class ToolIconBtn extends StatelessWidget {
  const ToolIconBtn({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: const MaterialStatePropertyAll(Size.fromHeight(38)),
        minimumSize: const MaterialStatePropertyAll(Size(44, 38)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: btnOutline),
          ),
        ),
      ),
      // child: Text('x'),
      child: Icon(icon, color: isDisabled ? btnOutline : btnText, size: 22),
    );
  }
}

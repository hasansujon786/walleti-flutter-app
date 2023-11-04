import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_styles.dart';
import 'tnx_date_picker.dart';

const disableColor = AppColors.extraLightGrey;

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
          ToolIconBtn(icon: const Icon(Icons.note_add_outlined), onPressed: toggleNote),
          const SizedBox(width: 4),
          TnxDatePicker(onPick: onSelectNewDate),
          const Spacer(),
          ToolIconBtn(
            icon: const Icon(Icons.send),
            onPressed: isSaveBtnDisablled ? null : () => onSave(context, ref),
          ),
        ],
      );
    });
  }
}

class ToolBtn extends StatelessWidget {
  const ToolBtn({super.key, required this.label, required this.icon, required this.onPressed});

  final Widget label;
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: label,
      icon: icon,
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppStyles.roundedXl)),
        ),
      ),
    );
  }
}

class ToolIconBtn extends StatelessWidget {
  const ToolIconBtn({super.key, required this.icon, this.onPressed});

  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;
    final primaryColor = Theme.of(context).primaryColor;

    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(isDisabled ? disableColor : primaryColor),
        overlayColor: MaterialStatePropertyAll(AppColors.primaryLight.withOpacity(0.3)),
        minimumSize: const MaterialStatePropertyAll(Size(48, 38)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyles.roundedXl),
            side: const BorderSide(color: disableColor),
          ),
        ),
      ),
    );
  }
}

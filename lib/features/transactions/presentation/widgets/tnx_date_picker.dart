import 'package:flutter/material.dart';

import '../../../../shared/extensions/date_time_extention.dart';
import 'transaction_form_toolbar.dart';

class TnxDatePicker extends StatefulWidget {
  const TnxDatePicker({
    super.key,
    this.restorationId,
    this.initialDate,
    required this.onPick,
  });

  final String? restorationId;
  final DateTime? initialDate;
  final void Function(DateTime?) onPick;

  @override
  State<TnxDatePicker> createState() => _TnxDatePickerState();
}

class _TnxDatePickerState extends State<TnxDatePicker> with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  // late final DateTime _firstDate;
  // late final DateTime _lastDate;
  late final RestorableDateTime _selectedDate;
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture;

  @override
  void initState() {
    super.initState();
    _selectedDate = RestorableDateTime(widget.initialDate ?? DateTime.now());
    _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
      onComplete: _selectDate,
      onPresent: (NavigatorState navigator, Object? arguments) {
        return navigator.restorablePush(
          _datePickerRoute,
          arguments: _selectedDate.value.millisecondsSinceEpoch,
        );
      },
    );
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(BuildContext context, Object? arguments) {
    final boundDate = DateTime.now();
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(boundDate.year - 1),
          lastDate: boundDate,
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(_restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      widget.onPick(newSelectedDate);
      setState(() {
        _selectedDate.value = newSelectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ToolBtn(
      icon: const Icon(Icons.today_outlined, size: 22),
      onPressed: () {
        _restorableDatePickerRouteFuture.present();
      },
      label: Text(_selectedDate.value.relateiveDate),
    );
  }
}

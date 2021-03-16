import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DatePicker extends StatelessWidget {
  DatePicker(
      {Key key,
      this.labelText,
      this.selectedDate,
      this.selectDate,
      this.dateFormat,
      this.locale})
      : super(key: key);

  final String labelText;
  final ValueChanged<DateTime> selectDate;
  DateTime selectedDate;

  final DateFormat dateFormat;
  final Locale locale;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        locale: locale,
        initialDate: selectedDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2200));
    if (picked != null && picked != selectedDate) selectDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    if (selectedDate == null) selectedDate = DateTime.now();
    final TextStyle valueStyle = Theme.of(context).textTheme.bodyText2;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          child: new _InputDropdown(
            labelText: labelText,
            valueText: dateFormat.format(selectedDate),
            valueStyle: valueStyle,
            onPressed: () {
              return _selectDate(context);
            },
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class TimePicker extends StatelessWidget {
  TimePicker({Key key, this.labelText, this.selectedTime, this.selectTime})
      : super(key: key);

  final String labelText;
  final ValueChanged<TimeOfDay> selectTime;
  TimeOfDay selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) selectTime(picked);
  }

  @override
  Widget build(BuildContext context) {
    if (selectedTime == null) selectedTime = TimeOfDay.now();
    final TextStyle valueStyle = Theme.of(context).textTheme.bodyText2;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 3,
          child: new _InputDropdown(
            valueText: selectedTime.format(context),
            valueStyle: valueStyle,
            onPressed: () {
              _selectTime(context);
            },
          ),
        ),
      ],
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef ValueChanged<T> = void Function(T fromDate, T toDate);

class DateSelectors extends StatefulWidget {
  final String fromDate;
  final String toDate;
  final ValueChanged<String> onDateChange;
  const DateSelectors(
      {super.key,
      required this.fromDate,
      required this.toDate,
      required this.onDateChange});

  @override
  State<DateSelectors> createState() => _DateSelectorsState();
}

class _DateSelectorsState extends State<DateSelectors> {
  late DateTime _fromDate;
  late DateTime _toDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .40,
            height: MediaQuery.of(context).size.height * .04,
            child: TextFormField(
              onTap: () => _selectDate(context, true),
              readOnly: true,
              controller: TextEditingController(
                  text: _fromDate.toString().substring(0, 10)),
              decoration: const InputDecoration(labelText: 'From Date'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .40,
            height: MediaQuery.of(context).size.height * .04,
            child: TextFormField(
              onTap: () => _selectDate(context, false),
              readOnly: true,
              controller: TextEditingController(
                  text: _toDate.toString().substring(0, 10)),
              decoration: const InputDecoration(labelText: 'To Date'),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate ? _fromDate : _toDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != (isFromDate ? _fromDate : _toDate)) {
      setState(() {
        isFromDate ? _fromDate = picked : _toDate = picked;
      });
    }
    widget.onDateChange(DateFormat('dd-MM-yyyy').format(_fromDate),
        DateFormat('dd-MM-yyyy').format(_toDate));
  }

  @override
  void initState() {
    super.initState();
    // _fromDate = DateTime.parse(widget.fromDate);
    // _toDate = DateTime.parse(widget.toDate);
    _fromDate = DateFormat('dd-MM-yyyy').parse(widget.fromDate);
    _toDate = DateFormat('dd-MM-yyyy').parse(widget.toDate);
  }
}

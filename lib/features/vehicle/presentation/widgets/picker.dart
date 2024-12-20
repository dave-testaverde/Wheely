import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../blocs/vehicle_bloc.dart';

class VehiclePicker extends StatefulWidget {
  const VehiclePicker({super.key, this.restorationId, required this.context, required this.state});

  final String? restorationId;
  final BuildContext context;
  final GetDetailsVehicleSuccessState state;  

  @override
  State<VehiclePicker> createState() => _VehiclePickerState();
}

class _VehiclePickerState extends State<VehiclePicker> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
        onComplete: _selectDate,
        onPresent: (NavigatorState navigator, Object? arguments) {
          return navigator.restorablePush(
            _datePickerRoute,
            arguments: _selectedDate.value.millisecondsSinceEpoch,
          );
        },
      );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 100)),
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
      setState(() {
        _selectedDate.value = newSelectedDate;
      });
      if (kDebugMode) {
        print('Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}');
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.resolveWith<double?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return 8;
          }
          return null;
        }),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.grey.withValues(alpha: 0.04);
            }
            if (states.contains(WidgetState.focused) ||
                states.contains(WidgetState.pressed)) {
              return Colors.grey.withValues(alpha: 0.12);
            }
            return null;
          },
        ),
      ),
      onPressed: () => _restorableDatePickerRouteFuture.present(),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_month,
            color: Colors.white,
            size: 19,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Select a day',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            )
          )
        ]
      )
    );
  }
}
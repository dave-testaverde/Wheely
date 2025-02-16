import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:wheely/core/di/service_locator.dart';
import 'package:wheely/features/vehicle/domain/entities/vehicle.dart';
import 'package:wheely/features/vehicle/presentation/pages/details_vehicle_screen.dart';

import '../../vehicle/domain/entities/cart.dart';
import '../../vehicle/presentation/blocs/vehicle_bloc.dart';
import '../../vehicle/presentation/pages/list_vehicle_screen.dart';

class AppRouter {
  GoRouter generateRoute() {
    return GoRouter(routes: [
      GoRoute(
        path: '/vehicle',
        name: 'details_vehicle',
        builder: (context, state) {
          Vehicle vehicle = state.extra as Vehicle;
          DateTime now = DateTime.now();
          return BlocProvider.value(
            value: sl<VehicleBloc>()
              ..add(GetDetailsVehicleEvent(
                Cart(
                  id: Uuid().v4(),
                  date: now,
                  dateLabel: DateFormat("dd-MM-yyyy").format(now),
                  slotFrom: "12:30",
                  slotTo: "13:30",
                  slotLabel: "from 12:30 to 13:30",
                  cost: vehicle.cost,
                  vehicle: vehicle
                )
              )),
            child: DetailsVehicleScreen(),
          );
        },
      ),
      GoRoute(
        path: '/',
        name: "list_vehicles",
        builder: (context, state) {
          return BlocProvider.value(
            value: sl<VehicleBloc>()
              ..add(GetAllVehiclesEvent()),
            child: const ListVehiclesScreen(),
          );
        },
      ),
    ]);
  }
}
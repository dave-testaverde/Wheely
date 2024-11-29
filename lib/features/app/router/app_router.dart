import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wheely/core/di/service_locator.dart';

import '../../vehicle/presentation/blocs/vehicle_bloc.dart';
import '../../vehicle/presentation/pages/list_vehicle_screen.dart';

class AppRouter {
  GoRouter generateRoute() {
    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocProvider.value(
            value: sl<VehicleBloc>()
              ..add(GetAllVehiclesEvent()),
            child: const ListVehiclesScreen(),
          );
        },
      )
    ]);
  }
}
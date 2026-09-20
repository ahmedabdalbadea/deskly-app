import 'package:deskly_app/features/home/manager/location_cubit/location_cubit.dart';
import 'package:deskly_app/features/home/view/widget/home_view_body.dart';
import 'package:deskly_app/features/home/view/widget/location_error_text.dart';
import 'package:deskly_app/features/home/view/widget/location_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBodyBlocBuilder extends StatelessWidget {
  const HomeViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationNotReady) {
          return LocationErrorText(
            onRetry: () {
              context.read<LocationCubit>().checkLocationReadiness();
            },
            message: state.message,
          );
        } else if (state is LocationReady) {
          return const HomeViewBody();
        }

        return const LocationLoading();
      },
    );
  }
}

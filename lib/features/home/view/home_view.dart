import 'package:deskly_app/features/home/data/repos/location_repo_impl.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_current_location_use_case.dart';
import 'package:deskly_app/features/home/manager/location_cubit/location_cubit.dart';
import 'package:deskly_app/features/home/view/widget/home_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocProvider(
          create: (context) => LocationCubit(
            fetchCurrentLocationUseCase: FetchCurrentLocationUseCase(
              locationRepo: LocationRepoImpl(),
            ),
          )..checkLocationReadiness(),
          child: const HomeViewBodyBlocBuilder(),
        ),
      ),
    );
  }
}

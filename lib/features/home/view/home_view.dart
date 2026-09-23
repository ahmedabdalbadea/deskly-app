import 'package:deskly_app/core/utils/service_locator.dart';
import 'package:deskly_app/features/home/manager/address_cubit/address_cubit.dart';
import 'package:deskly_app/features/home/manager/categoires_cubit/categoires_cubit.dart';
import 'package:deskly_app/features/home/manager/location_cubit/location_cubit.dart';
import 'package:deskly_app/features/home/manager/user_cubit/user_cubit.dart';
import 'package:deskly_app/features/home/manager/workspaces_cubit/workspaces_cubit.dart';
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  getIt<LocationCubit>()..checkLocationReadiness(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<WorkspacesCubit>()..fetchPopularWordspaces(),
            ),
            BlocProvider(create: (context) => getIt<AddressCubit>()),
            BlocProvider(
              create: (context) =>
                  getIt<CategoiresCubit>()..fetchCategories(),
            ),
            BlocProvider(
              create: (context) => getIt<UserCubit>()..fetchData(),
            ),
          ],
          child: const HomeViewBodyBlocBuilder(),
        ),
      ),
    );
  }
}

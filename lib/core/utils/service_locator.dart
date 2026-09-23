import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deskly_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:deskly_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:deskly_app/features/auth/domain/repos/auth_repo.dart';
import 'package:deskly_app/features/auth/domain/use_case/login/login_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/register/register_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/social_auth_use_case.dart';
import 'package:deskly_app/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:deskly_app/features/home/data/data%20source/home_local_data_source.dart';
import 'package:deskly_app/features/home/data/data%20source/home_remote_data_source.dart';
import 'package:deskly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:deskly_app/features/home/data/repos/location_repo_impl.dart';
import 'package:deskly_app/features/home/domain/repos/home_repo.dart';
import 'package:deskly_app/features/home/domain/repos/location_repo.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_address_from_location.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_categories_use_case.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_current_location_use_case.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_popular_workspaces_use_case.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_user_data_use_case.dart';
import 'package:deskly_app/features/home/manager/address_cubit/address_cubit.dart';
import 'package:deskly_app/features/home/manager/categoires_cubit/categoires_cubit.dart';
import 'package:deskly_app/features/home/manager/location_cubit/location_cubit.dart';
import 'package:deskly_app/features/home/manager/user_cubit/user_cubit.dart';
import 'package:deskly_app/features/home/manager/workspaces_cubit/workspaces_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);
  getIt.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);
  getIt.registerLazySingleton<Geocoding>(() => Geocoding());

  // Auth Feature
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      firebaseAuth: getIt(),
      fireStore: getIt(),
      googleSignIn: getIt(),
      facebookAuth: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: getIt()),
  );

  getIt.registerLazySingleton(() => LoginUseCase(authRepo: getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(authRepo: getIt()));
  getIt.registerLazySingleton(() => SocialAuthUseCase(authRepo: getIt()));
  getIt.registerLazySingleton(() => ResetPasswordUseCase(authRepo: getIt()));

  getIt.registerFactory(
    () => AuthCubit(
      registerUseCase: getIt(),
      loginUseCase: getIt(),
      socialAuthUseCase: getIt(),
      resetPasswordUseCase: getIt(),
    ),
  );

  // Home Feature Data & Repos
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(
      auth: getIt(),
      firestore: getIt(),
    ),
  );

  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSource(),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<LocationRepo>(
    () => LocationRepoImpl(geocoding: getIt()),
  );

  // Home Feature Use Cases
  getIt.registerLazySingleton(
    () => FetchCurrentLocationUseCase(locationRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => FetchPopularWorkspacesUseCase(homeRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => FetchCategoriesUseCase(homeRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => FetchUserDataUseCase(homeRepo: getIt()),
  );
  getIt.registerLazySingleton(
    () => FetchAddressFromLocation(locationRepo: getIt()),
  );

  // Home Feature Cubits
  getIt.registerFactory(
    () => LocationCubit(fetchCurrentLocationUseCase: getIt()),
  );
  getIt.registerFactory(
    () => WorkspacesCubit(fetchPopularWorkspacesUseCase: getIt()),
  );
  getIt.registerFactory(
    () => CategoiresCubit(fetchCategoriesUseCase: getIt()),
  );
  getIt.registerFactory(
    () => UserCubit(fetchUserDataUseCase: getIt()),
  );
  getIt.registerFactory(
    () => AddressCubit(fetchAddressUseCase: getIt()),
  );

  await getIt<AuthRemoteDataSource>().initializeGoogleSignIn();
}

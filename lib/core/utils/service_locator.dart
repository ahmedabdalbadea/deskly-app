import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deskly_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:deskly_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:deskly_app/features/auth/domain/repos/auth_repo.dart';
import 'package:deskly_app/features/auth/domain/use_case/login/login_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/register/register_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/social_auth_use_case.dart';
import 'package:deskly_app/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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

  await getIt<AuthRemoteDataSource>().initializeGoogleSignIn();
}

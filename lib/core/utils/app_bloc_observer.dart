import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('[BlocObserver] Created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(
      '[BlocObserver] ${bloc.runtimeType} '
      '${change.currentState.runtimeType} → ${change.nextState.runtimeType}',
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('[BlocObserver] Closed: ${bloc.runtimeType}');
  }
}

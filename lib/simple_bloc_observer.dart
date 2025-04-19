import 'dart:developer';
import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    _log('BLOC CREATED', '${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    _log('EVENT', '${bloc.runtimeType}', details: '$event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    _log(
      'STATE CHANGE', 
      '${bloc.runtimeType}',
      details: '${change.currentState} → ${change.nextState}',
    );
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    _log(
      'TRANSITION', 
      '${bloc.runtimeType}',
      details: '${transition.event} → ${transition.nextState}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _log(
      'ERROR', 
      '${bloc.runtimeType}',
      details: '$error',
      isError: true,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    _log('BLOC CLOSED', '${bloc.runtimeType}');
  }

  void _log(
    String action, 
    String blocName, {
    String? details,
    bool isError = false,
    StackTrace? stackTrace,
  }) {
    final message = '[$action] $blocName${details != null ? ': $details' : ''}';
    
    if (isError) {
      log(message, error: details, stackTrace: stackTrace, name: 'BLOC');
    } else {
      log(message, name: 'BLOC');
    }
  }
}
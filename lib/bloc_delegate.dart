import 'package:bloc/bloc.dart';

class AppBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
//    print(event);
  }


  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
//    print(transition);
  }
}

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:homemgt/balance.dart';
// import 'package:homemgt/homepage.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: HomePage(),
//       //home: Balance(), 
//       // theme: ThemeData(primarySwatch: Colors.red,brightness: Brightness.dark),
//       // themeMode: ThemeMode.dark, 
//        debugShowCheckedModeBanner: false,  
//        );
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemgt/bloc/authentication_bloc/authentication_event.dart';
import 'package:homemgt/screens/homepage.dart';
import './services/user_repository.dart';
import 'bloc/authentication_bloc/authentication_bloc.dart';
import 'bloc_delegate.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  Bloc.observer = AppBlocDelegate();
  final UserRepository userRepository = UserRepository();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      App(userRepository: userRepository, theme: theme),
    );
  });
}

class App extends StatefulWidget {
  final UserRepository _userRepository;
  final String theme;

  const App(
      {Key key, @required UserRepository userRepository, this.theme = "light"})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                  
                    home: MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (context)=>AuthenticationBloc(userRepository: UserRepository())..add(AppStarted()),)
                        ],
                        child: HomePage(),
                    ),
                  )
                ;
  }
}

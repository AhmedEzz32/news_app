
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';
import 'shared/bloc_observer.dart';
import 'shared/cubit/cubit.dart';
import 'shared/network/local/cashe_helper.dart';
import 'shared/network/remote/diohelper.dart';
import 'shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // BY2KD EN KOL HAGA FY METHOD KHELST w b3den yf7 app
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CasheHelper.init();
  bool? isDark = CasheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  Widget? startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
            AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light, // ThemeMode.dark,
            home: startWidget,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/layout/new_app/cubit/cubit.dart';
import 'package:project1/layout/new_app/cubit/states.dart';
import 'package:project1/modules/news_app/search/search_Screen.dart';
import 'package:project1/shared/components/components.dart';
import 'package:project1/shared/cubit/cubit.dart';
import 'package:project1/shared/network/remote/diohelper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit,NewsStates> (
    listener: (context,state){},
    builder: (context,state)
    {
      var cubit = NewsCubit.get(context);

      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
          actions:[
            IconButton(
              onPressed: () {
                navigateTo(context, SearchScreen());
              },
              icon: const Icon(Icons.search),
          ),
            IconButton(
              onPressed:(){
                AppCubit.get(context).changeAppMode();
              },
              icon: const Icon(Icons.brightness_4_outlined),
          ),
          ],
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);
          },
          items: cubit.bottomItem,
        ),
      );
    },
    );
  }
}

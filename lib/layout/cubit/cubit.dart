import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/business/business_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/sports/sports_screen.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/remote/diohelper.dart';
import 'states.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem =[
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business_sharp,
        ),
            label : 'Business',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
            label : 'Sports',

    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
            label : 'Science',

    ),
  ];

  List<Widget>screens =[
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index == 1){
      getSports();
    }
    if(index == 2){
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic>business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: HOME,

      query:
      {
        'country': 'us',
        'category': 'business',
        'apikey': 'd450ce8e16b247b5a34dda457aed0f01',
      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsBusinessSuccessState());
      
    }).catchError((error){
      print(error.toString());
      emit(NewsBusinessErrorState(error.toString()));
    });
  }

  List<dynamic>sports=[];
  void getSports(){
    emit(NewsGetSportsLoadingState());

    if(sports.isEmpty){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'sports',
          'apikey': 'd450ce8e16b247b5a34dda457aed0f01',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(business[0]['title']);
        emit(NewsSportsSuccessState());

      }).catchError((error){
        print(error.toString());
        emit(NewsSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsSportsSuccessState());
    }
  }

  List<dynamic>science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());

    if(science.isEmpty){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'science',
          'apikey': 'd450ce8e16b247b5a34dda457aed0f01',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsScienceSuccessState());

      }).catchError((error){
        print(error.toString());
        emit(NewsScienceErrorState(error.toString()));
      });
    }else{
      emit(NewsScienceSuccessState());
    }
  }

  List<dynamic>search=[];
  void getsearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q': value,
        'apikey': 'd450ce8e16b247b5a34dda457aed0f01',
      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsSearchSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsSearchErrorState(error.toString()));
    });
  }
}
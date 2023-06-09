import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/layout/new_app/cubit/cubit.dart';
import 'package:project1/layout/new_app/cubit/states.dart';
import 'package:project1/shared/components/components.dart';
import 'package:project1/shared/cubit/cubit.dart';
import 'package:project1/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
 var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value){
                    NewsCubit.get(context).getsearch(value!);
                  },
                  validate: (String ?value){
                    if(value!.isEmpty)
                    {
                      return 'search must not be Empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search  ,
                ),
              ),
              Expanded(child: ArticleBuilder( list: list , isSearch : true)),
            ],
          ),
        );
      },
    );
  }
}

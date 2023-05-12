import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/layout/new_app/cubit/cubit.dart';
import 'package:project1/layout/new_app/cubit/states.dart';
import 'package:project1/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, Object? state){},
      builder: (BuildContext context, state)
      {
        var list  = NewsCubit.get(context).business;

        return ArticleBuilder(list: list);
      },
    );
  }
}

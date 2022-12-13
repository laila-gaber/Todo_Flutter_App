import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laila_flutter/shared/components/components.dart';
import 'package:laila_flutter/shared/components/constants.dart';
import 'package:laila_flutter/shared/cubitt/cubit.dart';
import 'package:laila_flutter/shared/cubitt/states.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context ,state){},
      builder: (context ,state){
        var tasks = AppCubit.get(context).tasks;
        return ListView.separated(
          //the item that would be repeated
          //the index will iterate
          itemBuilder: (context, index) => BuildTaskItem(tasks[index]),
          //separting line design
          separatorBuilder: (context, index) =>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width:double.infinity,
              color: Colors.grey[400],
              height: 1,
            ),
          ) ,
          //number of repeated times
          itemCount: tasks.length,
        );

      },
    );



  }
}

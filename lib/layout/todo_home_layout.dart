import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:laila_flutter/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:laila_flutter/modules/done_tasks/done_tasks_screen.dart';
import 'package:laila_flutter/modules/new_tasks/new_tasks_screen.dart';
import 'package:laila_flutter/shared/colors.dart';
import 'package:laila_flutter/shared/components/components.dart';
import 'package:laila_flutter/shared/components/constants.dart';
import 'package:laila_flutter/shared/cubitt/cubit.dart';
import 'package:laila_flutter/shared/cubitt/states.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget
{
  var scaffoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();

  var titlecontroller=TextEditingController();
  var timecontroller=TextEditingController();
  var datecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..CreateDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
        },
       builder: (BuildContext context,AppStates state)
        {
          //create an objjjjject from the cubit
          AppCubit cubit=AppCubit.get(context);

          return Scaffold(

            key: scaffoldkey,
            appBar: AppBar(
              title:
              Text(
                cubit.titles[cubit.current_index],
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                ),
              ),
              backgroundColor: Colors.black,

            ),
            body:

            ConditionalBuilder(
              condition:state is ! AppGetDatabaseLoadingState , //the condition
              builder:(context) =>  cubit.screens[cubit.current_index] , //if true
              fallback:(context) => Center(child: CircularProgressIndicator()) , //else
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: ()
              {

                if (cubit.isbottomsheetshown)
                {

                  if(formkey.currentState.validate()) {
                   cubit.InsertToDatabase(title: titlecontroller.text, time: timecontroller.text, date: datecontroller.text);


                  }
                }
                else
                {
                  scaffoldkey.currentState.showBottomSheet(
                        (context) => Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),

                          child: Form(
                            key: formkey,

                           child: Column(

                            mainAxisSize: MainAxisSize.min,
                            children:
                            [
                              defaultformfield(
                                controller: titlecontroller,
                                type: TextInputType.text,

                                validate: (String value)
                                {
                                  if(value.isEmpty)
                                    return 'title must not be empty';
                                  return null;
                                },
                                labeltext:" task title",
                                prefix: Icons.title,
                              ),
                              SizedBox(height: 20,),
                              defaultformfield(
                                controller: timecontroller,
                                type: TextInputType.datetime,
                                onTap:(){
                                  showTimePicker(context: context,
                                      initialTime: TimeOfDay.now()
                                  ).then((value)
                                  {
                                    timecontroller.text=value.format(context);
                                    print(value.format(context));
                                  });
                                },
                                validate: (String value)
                                {
                                  if(value.isEmpty)
                                    return 'time must not be empty';
                                  return null;
                                },
                                labeltext:" task time",
                                prefix: Icons.watch_later_outlined,
                              ),
                              SizedBox(height: 20,),
                              defaultformfield(
                                controller: datecontroller,
                                type: TextInputType.datetime,
                                onTap:(){
                                  showDatePicker(context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-12-05'),
                                  ).then((value)
                                  {

                                    datecontroller.text=DateFormat.yMMMd().format(value);
                                  });
                                },
                                validate: (String value)
                                {
                                  if(value.isEmpty)
                                    return 'date must not be empty';
                                  return null;
                                },
                                labeltext:" task date",
                                prefix: Icons.calendar_today_sharp,
                              ),
                            ],
                          ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value){  //trying to detect the hand closing
                   cubit.ChangeBottomSheetState(isShow: false, icon: Icons.edit);
                  });
                  cubit.ChangeBottomSheetState(isShow: true, icon: Icons.add);
                }

              },
              child: Icon(
                cubit.fabicon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.current_index,
              onTap: (index) {
                cubit.ChangeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.orange,
                    ),
                    label: 'Tasks'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check_circle_outline,
                      color: Colors.orange,
                    ),
                    label: 'Done'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.archive_outlined,
                      color: Colors.orange,
                    ),
                    label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }



}

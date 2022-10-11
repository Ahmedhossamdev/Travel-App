import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/navpages/main_page.dart';

import '../pages/welcome_page.dart';

class AppCubitsLogics extends StatefulWidget {
  const AppCubitsLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitsLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitsLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
           if (state is WelcomeState){
             return WelcomePage();
           }
           if (state is LoadingState){
             return Center(child: CircularProgressIndicator(),);
           }
           if (state is LoadedState){
             return MainPage();
           }
           if (state is DetailState){
             return DetailPage();
           }
           else {
             return Container();
           }
        },
      ),
    );
  }
}

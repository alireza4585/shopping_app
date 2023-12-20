import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/data/bloc/home_bloc/home_bloc.dart';
import 'package:shopping_app/data/bloc/home_bloc/home_event.dart';
import 'package:shopping_app/screens/home.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = HomeBloc();
        bloc.add(HomeGetInitilzeData());
        return bloc;
      },
      child: Home_Screen(),
    );
  }
}

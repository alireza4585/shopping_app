import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Screens/home.dart';
import 'package:shopping_app/data/bloc/home_bloc/home_bloc.dart';
import 'package:shopping_app/data/bloc/home_bloc/home_event.dart';

class MainAuth extends StatelessWidget {
  const MainAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = HomeBloc();
        bloc.add(HomeGetInitilzeData());
        return bloc;
      },
      child: HomeScreen(),
    );
  }
}

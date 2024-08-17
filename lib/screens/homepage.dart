import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/api_bloc.dart';

import 'package:learn_bloc/screens/enterNewpage.dart';
import 'package:learn_bloc/screens/main_screen.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("I am re run again");

    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch data with Internet or Without Internet"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Fatch Data"),
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => EnterNewPage()));
            BlocProvider.of<ApiBloc>(context)
                .add(FatchDataEvent(isFavoriteItem: false));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreem()));
          },
        ),
      ),
    );
  }
}

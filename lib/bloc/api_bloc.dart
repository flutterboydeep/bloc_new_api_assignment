import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:learn_bloc/models/blogs_model.dart';
import 'package:learn_bloc/data/repository/product_repo.dart';

part 'api_event.dart';
part 'api_state.dart';

Box myBox = Hive.box('blogsDataBox');

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final BlogsRepo blogsRepo;

  ApiBloc(this.blogsRepo) : super(ApiInitialState()) {
    // on<IsFavoriteEvent>(isfavoriteEvent);
    on<FatchDataEvent>((event, emit) async {
      emit(ApiLoadingState());

      BlogsModel? blogsModel;
      var localData = await myBox.get('blogs');
      var localDataMap;

      try {
        if (localData != null) {
          localDataMap = await convertToMapOfStringDynamic(localData as Map);
          blogsModel = BlogsModel.fromJson(localDataMap);
          emit(ApiLoadedState(blogsModel, isFavorite: event.isFavoriteItem));
        }

        var apiData = await blogsRepo.getData();
        myBox.put('blogs', apiData.toJson());
        localData = myBox.get('blogs');
        localDataMap = await convertToMapOfStringDynamic(localData);

        blogsModel = await BlogsModel.fromJson(localDataMap);
        emit(ApiLoadedState(blogsModel, isFavorite: event.isFavoriteItem));
      } on SocketException catch (e) {
        print("this is blocModel in soket exception $blogsModel");
        log("SocketException during local data fetch: $e");
      } catch (e) {
        if (e.toString() == "SocKetException") {
          // if (localData.keys.isNotEmpty) {
          var localData = await myBox.get('blogs') as Map<String, dynamic>;
          var localDataMap = convertToMapOfStringDynamic(localData as Map);
          blogsModel = BlogsModel.fromJson(localDataMap);
          emit(ApiLoadedState(blogsModel, isFavorite: event.isFavoriteItem));
        } else {
          emit(ApiFailureState(
              Error: "First time we will need Internet Connection $e"));
        }
        // } else {
        //   emit(ApiFailureState(Error: "Error is : ${e.toString()}"));
        // }
      }
    });
  }

// void isfavoriteEvent(IsFavoriteEvent event, emit<ApiInitialState>()){

// }

  Map<String, dynamic> convertToMapOfStringDynamic(
      Map<dynamic, dynamic> input) {
    return input.map(
      (key, value) {
        if (value is Map) {
          return MapEntry(key.toString(), convertToMapOfStringDynamic(value));
        } else if (value is List) {
          return MapEntry(
              key.toString(),
              value.map((item) {
                if (item is Map) {
                  return convertToMapOfStringDynamic(item);
                } else {
                  return item;
                }
              }).toList());
        } else {
          return MapEntry(key.toString(), value);
        }
      },
    );
  }
}

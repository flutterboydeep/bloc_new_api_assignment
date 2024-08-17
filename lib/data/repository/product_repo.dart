import 'dart:async';
import 'dart:convert';

import 'package:learn_bloc/data/data_provider/api_data_provider.dart';
import 'package:learn_bloc/models/blogs_model.dart';

class BlogsRepo {
  final ApiDataProvider apiDataProvider;

  // late StreamSubscription<ConnectivityResult> subscription;
  BlogsRepo(this.apiDataProvider);

  connectivity() {}

  Future<BlogsModel> getData() async {
    try {
      String FakeApiData = await apiDataProvider.responsData();
      final DecodeData = jsonDecode(FakeApiData);
      // BlogsModel blogsModelFromJson(String str) => BlogsModel.fromJson(json.decode(str));

// String blogsModelToJson(BlogsModel data) => json.encode(data.toJson());

      return BlogsModel.fromJson(DecodeData);
    } catch (e) {
      throw e.toString();
    }
  }
}

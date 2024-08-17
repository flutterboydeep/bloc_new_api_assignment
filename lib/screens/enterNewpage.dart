import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:learn_bloc/bloc/api_bloc.dart';
import 'package:learn_bloc/models/blogs_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:learn_bloc/screens/favorite_items.dart';

var favBox = Hive.box('blogsDataBox');

class EnterNewPage extends StatefulWidget {
  @override
  State<EnterNewPage> createState() => _EnterNewPageState();
}

class _EnterNewPageState extends State<EnterNewPage> {
  void addFavoriteItem(Blog blog) {
    favBox.put(blog.id, blog.toJson());

    // if (!favorites.contains(blog.id)) {
    //   favorites.add(blog.id.toString());
    //   favBox.put('fav', favorites);
    // }
    print('Stored Blog Data for ID ${blog.id}: ${favBox.get(blog.id)}');
  }

  @override
  void initState() {
    super.initState();
    // updateData();
  }

  // bool isFavorite = false;
  // updateData() {
  //   return BlocBuilder<ApiBloc, ApiState>(
  //     builder: (context, state) {
  //       if (state is ApiLoadedState) {
  //         for (int i = 0; i < state.blocModel.blogs!.length; i++) {
  //           var blog = state.blocModel.blogs![i];
  //           isFavorite = favBox.get(blog.id) != null;
  //         }
  //       }

  //       return Container();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        if (state is ApiLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ApiFailureState) {
          // Future.delayed(Duration(seconds: 2), () {
          //   return Center(child: CircularProgressIndicator());
          // });
          return Center(child: Text(state.Error));
        }
        if (state is ApiLoadedState) {
          return ListView.builder(
            controller: ScrollController(),
            itemCount: state.blocModel.blogs!.length,
            itemBuilder: (context, index) {
              final blog = state.blocModel.blogs![index];
              // final bool isFavorite = favBox.get('fav').map((value) {
              //   var favData = BlogsModel.fromJson(value);
              //   if (favData.blogs![index].id == blog.id) {
              //     return true;
              //   } else {
              //     return false;
              //   }
              // }).toList();

              // final ValueNotifier isFavorite = ValueNotifier('');
              // BlocProvider.of<ApiBloc>(context).add(FatchDataEvent(
              //     isFavoriteItem: favBox.get(blog.id) != null));
              final isFavorite = favBox.get(blog.id) != null;

              return Padding(
                padding: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: Row(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: CachedNetworkImage(
                                imageUrl: blog.imageUrl.toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Wrap(
                              children: [
                                Text(
                                  blog.title.toString(),
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (isFavorite) {
                                favBox.delete(blog.id);

                                setState(() {});
                              } else {
                                addFavoriteItem(blog);

                                // BlocProvider.of<ApiBloc>(context).add(
                                //     FatchDataEvent(
                                //         isFavoriteItem:
                                //             favBox.get(blog.id) != null));
                                log("This is bloc related stuff ${isFavorite}");
                                setState(() {});
                              }
                            },
                            icon: isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Center(child: Text('Some Error Occurred'));
      },
    );
  }
}

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_bloc/bloc/api_bloc.dart';
import 'package:learn_bloc/screens/enterNewpage.dart';

import '../models/blogs_model.dart';

class FavouriteItems extends StatefulWidget {
  @override
  State<FavouriteItems> createState() => _FavouriteItemsState();
}

class _FavouriteItemsState extends State<FavouriteItems>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var listOfFavIds = favBox.get('fav');
    List listOfFavMap = listOfFavIds.map((e) {
      return favBox.get(e);
    }).toList();

    // for (int i = 0; i < listOfFavMap.length; i++) {
    //   if (listOfFavMap[i] == "null") {
    //     log("this is that index who have you removed $i");
    //     listOfFavMap.removeAt(i);
    //   }
    // }

    listOfFavMap.removeWhere(
      (element) {
        return element == null;
      },
    );
    // listOfFavMap = listOfFavMap.removeWhere((element) => element = null).toList();
    // log("this is favitem $listOfFavMap");
    // var favItem = convertToMapOfStringDynamic(fav);
    // var blogModel = BlogsModel.fromJson(listOfFavMap);

    return FutureBuilder(
      future: favData(listOfFavMap),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text("Some error occured");
        }
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  maxCrossAxisExtent: 200),
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              itemCount: listOfFavMap.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 160,
                  width: 160,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                              imageUrl: listOfFavMap[index]['image_url'],
                              fit: BoxFit.cover,
                              placeholder: (context, url) {
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                              errorWidget: (context, url, error) {
                                return Icon(Icons.error);
                              }),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: IconButton(
                              onPressed: () {
                                favBox.delete(listOfFavMap[index]['id']);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 255, 245, 245),
                              )),
                        ),
                      )
                    ],
                  ),
                );
              }),
        );
        // return ListTile(
        //   leading: SizedBox(
        //     height: 130,
        //     width: 100,
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(11),
        //       child: CachedNetworkImage(
        //           imageUrl: listOfFavMap[index]['image_url'],
        //           fit: BoxFit.cover,
        //           placeholder: (context, url) {
        //             return Center(child: CircularProgressIndicator());
        //           },
        //           errorWidget: (context, url, error) {
        //             return Icon(Icons.error);
        //           }),
        //     ),
        //   ),
        //   title: Text(listOfFavMap[index]['title']),
        //   trailing: IconButton(
        //     icon: Icon(Icons.close),
        //     onPressed: () async {
        //       print(
        //           "this is in on Pressed id ${listOfFavMap[index]['id']}");
        //       await favBox.delete(listOfFavMap[index]['id']);
        //       setState(() {});
        //     },
        //   ),
        // );
      },

      // body: Container(
      //   child: Text("hellow"),
      // ),
    );

    // body: ValueListenableBuilder(
    //   valueListenable: favBox.listenable(keys: ['fav']),
    //   builder: (context, Box box, _) {
    //     final favoriteIds =
    //         (box.get('fav', defaultValue: <String>[]) as List<dynamic>)
    //             .map((e) => e as String)
    //             .toList();

    //     if (favoriteIds.isEmpty) {
    //       return Center(child: Text("No Favorite Items"));
    //     }

    //     return FutureBuilder<List<Blog>>(
    //       future: fetchFavoriteBlogs(favoriteIds),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return Center(child: CircularProgressIndicator());
    //         }
    //         if (snapshot.hasError) {
    //           return Center(
    //               child: Text("Error loading favorites: ${snapshot.error}"));
    //         }
    //         if (snapshot.data == null || snapshot.data!.isEmpty) {
    //           return Center(child: Text("No Favorite Items"));
    //         }

    //         final favoriteBlogs = snapshot.data!;

    //         return ListView.builder(
    //           itemCount: favoriteBlogs.length,
    //           itemBuilder: (context, index) {
    //             final blog = favoriteBlogs[index];
    //             return ListTile(
    //               leading: blog.imageUrl != null
    //                   ? Image.network(blog.imageUrl!)
    //                   : null,
    //               title: Text(blog.title ?? 'No Title'),
    //             );
    //           },
    //         );
    //       },
    //     );
    //   },
    // ),
  }

  Future<List<dynamic>> favData(listOfFavMap) async {
    // for (int i = 0; i < listOfFavMap.length; i++) {
    //   if (listOfFavMap[i] == null) {
    //     listOfFavMap.removeAt(i);
    //   }
    // }
    log("this is favitem $listOfFavMap");
    return listOfFavMap;
  }
}

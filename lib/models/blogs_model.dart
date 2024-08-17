// This model is made by quickType.io website

// To parse this JSON data, do

// final productModel = productModelFromJson(jsonString);

// import 'dart:convert';

// List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
//     json.decode(str).map((x) => ProductModel.fromJson(x)));

// String productModelToJson(List<ProductModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProductModel {
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   Category? category;
//   String? image;
//   Rating? rating;

//   ProductModel({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.image,
//     this.rating,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"]?.toDouble(),
//         description: json["description"],
//         category: categoryValues.map[json["category"]]!,
//         image: json["image"],
//         rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": categoryValues.reverse[category],
//         "image": image,
//         "rating": rating?.toJson(),
//       };
// }

// enum Category { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

// final categoryValues = EnumValues({
//   "electronics": Category.ELECTRONICS,
//   "jewelery": Category.JEWELERY,
//   "men's clothing": Category.MEN_S_CLOTHING,
//   "women's clothing": Category.WOMEN_S_CLOTHING
// });

// class Rating {
//   double? rate;
//   int? count;

//   Rating({
//     this.rate,
//     this.count,
//   });

//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         rate: json["rate"]?.toDouble(),
//         count: json["count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "rate": rate,
//         "count": count,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final blogsModel = blogsModelFromJson(jsonString);

// import 'dart:convert';

// // BlogsModel blogsModelFromJson(String str) => BlogsModel.fromJson(json.decode(str));

// // String blogsModelToJson(BlogsModel data) => json.encode(data.toJson());

// class BlogsModel {
//   List<Blog>? blogs;

//   BlogsModel({
//     this.blogs,
//   });

//   factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
//         blogs: json["blogs"] == null
//             ? []
//             : List<Blog>.from(json["blogs"]!.map((x) => Blog.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "blogs": blogs == null
//             ? []
//             : List<dynamic>.from(blogs!.map((x) => x.toJson())),
//       };
// }

// class Blog {
//   String? id;
//   String? imageUrl;
//   String? title;

//   Blog({
//     this.id,
//     this.imageUrl,
//     this.title,
//   });

//   factory Blog.fromJson(Map<String, dynamic> json) => Blog(
//         id: json["id"],
//         imageUrl: json["image_url"],
//         title: json["title"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image_url": imageUrl,
//         "title": title,
//       };
// }

import 'dart:convert';

class BlogsModel {
  List<Blog>? blogs;

  BlogsModel({
    this.blogs,
  });

  factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
        blogs: json["blogs"] == null
            ? []
            : List<Blog>.from(json["blogs"]!.map((x) => Blog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "blogs": blogs == null
            ? []
            : List<dynamic>.from(blogs!.map((x) => x.toJson())),
      };
}

class Blog {
  String? id;
  String? imageUrl;
  String? title;

  Blog({
    this.id,
    this.imageUrl,
    this.title,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        imageUrl: json["image_url"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "title": title,
      };
}

// Helper functions for JSON conversion
BlogsModel blogsModelFromJson(String str) =>
    BlogsModel.fromJson(json.decode(str));

String blogsModelToJson(BlogsModel data) => json.encode(data.toJson());








// import 'dart:convert';

// class BlogsModel {
//   List<Blog>? blogs;

//   BlogsModel({this.blogs});

//   factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
//         blogs: json["blogs"] == null
//             ? []
//             : List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "blogs": blogs == null
//             ? []
//             : List<dynamic>.from(blogs!.map((x) => x.toJson())),
//       };
// }

// class Blog {
//   String? id;
//   String? imageUrl;
//   String? title;

//   Blog({this.id, this.imageUrl, this.title});

//   factory Blog.fromJson(Map<String, dynamic> json) => Blog(
//         id: json["id"],
//         imageUrl: json["image_url"],
//         title: json["title"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image_url": imageUrl,
//         "title": title,
//       };
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:learn_bloc/bloc/api_bloc.dart';
import 'package:learn_bloc/data/data_provider/api_data_provider.dart';

import 'package:learn_bloc/screens/homepage.dart';
import 'package:learn_bloc/data/repository/product_repo.dart';
import 'package:learn_bloc/models/blogs_model.dart';
import 'package:learn_bloc/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // final box = await Hive.openBox('blogsDataBox');
  await readFromHive();
  runApp(const MyApp());
}

Future<Iterable<Map<String, dynamic>>> readFromHive() async {
  final box = await Hive.openBox('blogsDataBox');
  final result = box.values.cast<Map<String, dynamic>>();
  return result;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BlogsRepo(ApiDataProvider()),
      child: BlocProvider(
        create: (context) => ApiBloc(context.read<BlogsRepo>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          // darkTheme: ThemeData.dark(),
          theme: ThemeData(
            brightness: Brightness.dark,
            // colorScheme: ColorScheme.fromSeed(
            //     seedColor: const Color.fromARGB(255, 97, 6, 255)),
            useMaterial3: true,
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}

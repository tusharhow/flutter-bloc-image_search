import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_image_search/data/datasources/remote/image_datasource_impl.dart';
import 'package:flutter_bloc_image_search/data/repositories/image_repository_impl.dart';
import 'package:flutter_bloc_image_search/domain/use_cases/image_use_case.dart';
import 'package:flutter_bloc_image_search/presentation/bloc/image_bloc.dart';
import 'package:flutter_bloc_image_search/presentation/screens/home_page/image_screen.dart';

import 'data/datasources/remote/image_datasource.dart';
import 'domain/repositories/image_repository.dart';

void main() {
  final ImageDataSource dataSource = ImageDataSourceImpl(dio: Dio());
  final ImageRepository repository =
      ImageRepositoryImpl(dataSource: dataSource);
  final FetchImagesUseCase useCase = FetchImagesUseCase(repository);
  final ImageBloc bloc = ImageBloc(imagesUseCase: useCase);
  runApp(MyApp(bloc: bloc));
}

class MyApp extends StatelessWidget {
  final ImageBloc bloc;

  const MyApp({super.key, required this.bloc});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => bloc,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Image Search',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImageScreen(),
      ),
    );
  }
}

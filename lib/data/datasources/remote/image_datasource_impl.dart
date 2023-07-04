import 'package:dio/dio.dart';
import 'package:flutter_bloc_image_search/data/datasources/remote/image_datasource.dart';
import 'package:flutter_bloc_image_search/data/models/image_model.dart';
import 'package:flutter_bloc_image_search/domain/entities/image_entity.dart';

class ImageDataSourceImpl extends ImageDataSource {
  final Dio dio;

  ImageDataSourceImpl({required this.dio});
  @override
  Future<List<ImageEntity>> getSearchedImages(
      String apiKey, String query) async {
    final response = await dio
        .get('https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo');
    if (response.statusCode == 200) {
      return (response.data['hits'] as List)
          .map((e) => ImageModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}

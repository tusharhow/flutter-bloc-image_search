import 'package:flutter_bloc_image_search/data/datasources/remote/image_datasource.dart';
import 'package:flutter_bloc_image_search/domain/entities/image_entity.dart';
import 'package:flutter_bloc_image_search/domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource dataSource;

  ImageRepositoryImpl({required this.dataSource});

  @override
  Future<List<ImageEntity>> fetchImages(String apiKey, String query) {
    return dataSource.getSearchedImages(apiKey, query);
  }
}

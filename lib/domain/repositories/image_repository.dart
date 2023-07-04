import 'package:flutter_bloc_image_search/domain/entities/image_entity.dart';

abstract class ImageRepository {
  Future<List<ImageEntity>> fetchImages(String apiKey, String query);
}

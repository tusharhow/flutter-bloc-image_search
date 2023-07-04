import 'package:flutter_bloc_image_search/domain/entities/image_entity.dart';
import 'package:flutter_bloc_image_search/domain/repositories/image_repository.dart';

class FetchImagesUseCase {
  final ImageRepository repository;

  FetchImagesUseCase(this.repository);

  Future<List<ImageEntity>> fetchImages(String apiKey, String query) {
    return repository.fetchImages(apiKey, query).then(
          (imageModels) => imageModels
              .map(
                (model) => ImageEntity(
                  previewURL: model.previewURL,
                ),
              )
              .toList(),
        );
  }
}

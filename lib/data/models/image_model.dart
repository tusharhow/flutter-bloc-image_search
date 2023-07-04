import 'package:flutter_bloc_image_search/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  final String previewURL;

  const ImageModel({
    required this.previewURL,
  }) : super(previewURL: previewURL);

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      previewURL: json['previewURL'],
    );
  }
}

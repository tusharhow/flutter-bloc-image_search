import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String previewURL;

  const ImageEntity({
    required this.previewURL,
  });

  @override
  List<Object> get props => [previewURL];
}

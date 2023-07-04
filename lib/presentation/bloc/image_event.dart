part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class ImageSearch extends ImageEvent {
  final String query;

  const ImageSearch({required this.query});

  @override
  List<Object> get props => [query];
}

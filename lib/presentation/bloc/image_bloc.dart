import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_image_search/common/api_constant.dart';
import 'package:flutter_bloc_image_search/domain/entities/image_entity.dart';
import 'package:flutter_bloc_image_search/domain/use_cases/image_use_case.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final FetchImagesUseCase imagesUseCase;

  ImageBloc({required this.imagesUseCase}) : super(ImageInitial()) {
    on<ImageSearch>((event, emit) async {
      emit(ImageLoading());
      try {
        final images = await imagesUseCase.fetchImages(Api_Key, event.query);
        emit(ImageLoaded(images: images));
      } catch (e) {
        emit(ImageError(message: e.toString()));
      }
    });
  }
}

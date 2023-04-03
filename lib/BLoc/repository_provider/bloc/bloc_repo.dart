import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/repo.dart';

abstract class ImageEvent {}

class InitialEvent extends ImageEvent {}

class LoadEvent extends ImageEvent {}

abstract class ImageState {
  int counter;
  ImageState(this.counter);
}

class LoadingState extends ImageState {
  LoadingState(super.counter);
}

class LoadedState extends ImageState {
  final String img;
  final int num;
  LoadedState(this.img, this.num) : super(0);
}

class ErrorState extends ImageState {
  ErrorState(super.counter);
}

class BlocRepo extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository = ImageRepository();

  BlocRepo() : super(LoadingState(1)) {
    on<InitialEvent>((event, emit) {
      emit(LoadingState(1));
    });
    on<LoadEvent>((event, emit) {
      try {
        final img = imageRepository.getImage((state.counter + 1).toString());
        emit(LoadedState(img, state.counter));
      } catch (e) {
        emit(ErrorState(1));
      }
    });
  }
}

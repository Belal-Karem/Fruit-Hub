import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entites/about_entity.dart';
import '../../../domain/repo/about_repo.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  final AboutRepo aboutRepo;
  AboutCubit(this.aboutRepo) : super(AboutInitial());

  Future<void> getAbout() async {
    emit(AboutLoading());
    var result = await aboutRepo.getAbout();
    result.fold((failure) => emit(AboutFailure(failure.message)), (about) {
      emit(AboutSuccess(about));
    });
  }
}

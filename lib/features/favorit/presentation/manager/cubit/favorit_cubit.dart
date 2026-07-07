import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/features/favorit/domain/entites/favorit_entity.dart';
import 'package:fruit_hub/features/favorit/domain/repo/favorit_repo.dart';

import '../../../../../core/entites/product_entity.dart';
import '../../../../../core/helper_functions/get_user.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  final FavoritRepo favoritRepo;
  FavoritCubit(this.favoritRepo) : super(FavoritInitial());
  int favoritCount = 0;

  void addFavorit(ProductEntity productEntity, bool isFavorit) async {
    emit(FavoritLoading());
    var result = await favoritRepo.addFavorit(
      favoritEntity: FavoritEntity(
        uId: getUserData().uId!,
        isFavorit: isFavorit,
        products: productEntity,
      ),
    );
    result.fold(
      (failure) => emit(FavoritFailure(failure.message)),
      (_) => emit(AddFavoritSuccess()),
    );
  }

  void getFavorit() async {
    emit(FavoritLoading());
    var result = await favoritRepo.getFavorit();
    result.fold((failure) => emit(FavoritFailure(failure.message)), (products) {
      favoritCount = products.length;
      emit(GetFavoritSuccess(products));
    });
  }
}

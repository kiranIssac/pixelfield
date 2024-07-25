import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionCubit extends Cubit<int> {
  CollectionCubit() : super(0);

  void onItemTapped(int index) {
    emit(index);
  }
}

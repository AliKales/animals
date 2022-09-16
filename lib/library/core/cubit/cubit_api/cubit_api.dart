import 'package:animals/library/core/cubit/cubit_api/cubit_states_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitApi extends Cubit<CSApi> {
  CubitApi() : super(const CSStart());

  void fetchData(Future function) async {
    emit(const CSLoading());

    var response = await function;

    if (response == null) {
      emit(const CSError());
    } else {
      emit(CSCompleted(response));
    }
  }

  void reset() {
    emit(const CSStart());
  }
}

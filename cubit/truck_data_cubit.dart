import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truck_app/data/model/truck_model.dart';

part 'truck_data_state.dart';

class TruckDataCubit extends Cubit<TruckDataState> {
  TruckDataCubit() : super(const TruckDataInitial());
}

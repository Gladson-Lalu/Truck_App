part of 'truck_data_cubit.dart';

@immutable
abstract class TruckDataState {
  const TruckDataState();
}

class TruckDataInitial extends TruckDataState {
  const TruckDataInitial();
}

class TruckDataLoading extends TruckDataState {
  const TruckDataLoading();
}

class TruckDataSuccess extends TruckDataState {
  final List<TruckModel> truckData;
  const TruckDataSuccess(this.truckData);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TruckDataSuccess &&
        listEquals(other.truckData, truckData);
  }

  @override
  int get hashCode => truckData.hashCode;

  @override
  String toString() =>
      'TruckDataSuccess(truckData: $truckData)';
}

class TruckDataFailure extends TruckDataState {
  final String message;
  const TruckDataFailure(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TruckDataFailure &&
        other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

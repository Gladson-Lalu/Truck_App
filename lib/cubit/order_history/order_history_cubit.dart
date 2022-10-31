import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/order_model.dart';
import '../../data/services/firestore_service.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  final FireStoreService _storeService;
  OrderHistoryCubit(this._storeService)
      : super(const OrderHistoryInitial());

  Future<void> getOrderHistory() async {
    emit(const OrderHistoryLoading());
    try {
      final orderHistory =
          await _storeService.getOrderHistory();
      emit(OrderHistorySuccess(orderHistory));
    } catch (e) {
      emit(OrderHistoryFailure(
          e.toString().split('Exception: ')[1]));
    }
  }

  Future<void> paymentSuccess(OrderModel order) async {
    emit(const OrderHistoryLoading());
    try {
      await _storeService.addOrder(order);
      final orderHistory =
          await _storeService.getOrderHistory();
      emit(OrderHistorySuccess(orderHistory));
    } catch (e) {
      emit(OrderHistoryFailure(
          e.toString().split('Exception: ')[1]));
    }
  }
}

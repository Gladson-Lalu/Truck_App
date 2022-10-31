import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/order_model.dart';
import '../order_history/order_history_cubit.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final OrderHistoryCubit _orderHistoryCubit;

  PaymentCubit(this._orderHistoryCubit)
      : super(const PaymentInitial());

  Future<void> paymentSuccess(OrderModel orderModel) async {
    emit(const PaymentLoading());
    try {
      await _orderHistoryCubit.paymentSuccess(orderModel);
      emit(const PaymentSuccess());
    } catch (e) {
      emit(PaymentFailure(
          e.toString().split('Exception: ')[1]));
    }
  }
}

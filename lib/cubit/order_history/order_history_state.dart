part of 'order_history_cubit.dart';

@immutable
abstract class OrderHistoryState {
  const OrderHistoryState();
}

class OrderHistoryInitial extends OrderHistoryState {
  const OrderHistoryInitial();
}

class OrderHistoryLoading extends OrderHistoryState {
  const OrderHistoryLoading();
}

class OrderHistorySuccess extends OrderHistoryState {
  final List<OrderModel> orderHistory;
  const OrderHistorySuccess(this.orderHistory);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderHistorySuccess &&
        listEquals(other.orderHistory, orderHistory);
  }

  @override
  int get hashCode => orderHistory.hashCode;
}

class OrderHistoryFailure extends OrderHistoryState {
  final String message;
  const OrderHistoryFailure(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderHistoryFailure &&
        other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

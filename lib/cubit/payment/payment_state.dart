part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {
  const PaymentState();
}

class PaymentInitial extends PaymentState {
  const PaymentInitial();
}

class PaymentLoading extends PaymentState {
  const PaymentLoading();
}

class PaymentSuccess extends PaymentState {
  const PaymentSuccess();
}

class PaymentFailure extends PaymentState {
  final String message;
  const PaymentFailure(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentFailure &&
        other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

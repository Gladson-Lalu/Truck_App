import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../data/model/order_model.dart';
import '../../../../../cubit/order_history/order_history_cubit.dart';

class OrderHistoryFragment extends StatelessWidget {
  const OrderHistoryFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 10),
          child: Text('Order History',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800])),
        ),
        Expanded(
          child: BlocConsumer<OrderHistoryCubit,
              OrderHistoryState>(
            listener: (context, state) {
              if (state is OrderHistoryFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is OrderHistoryInitial) {
                return const Center(
                  child: Text('No Bookings',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                );
              } else if (state is OrderHistoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is OrderHistorySuccess &&
                  state.orderHistory.isNotEmpty) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.orderHistory.length,
                  itemBuilder:
                      (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: buildBookedCard(
                            state.orderHistory[index]),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    'No Bookings',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  buildBookedCard(OrderModel orderHistory) {
    //truckModel is the model of the truck that is booked
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 2),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8)),
              child: Image.network(
                orderHistory.imageUrl,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    orderHistory.modelNumber,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    orderHistory.brand,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //format date with intl package in format dd/MM/yyyy
                  Text(
                    'Date: ' +
                        DateFormat('dd/MM/yyyy')
                            .format(orderHistory.date),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Time: ' +
                        DateFormat('hh:mm a')
                            .format(orderHistory.date),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  //total
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Total: \$' + orderHistory.totalAmount,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

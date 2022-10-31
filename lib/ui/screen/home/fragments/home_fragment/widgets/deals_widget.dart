import 'package:flutter/material.dart';

import '../../../../../../data/model/truck_model.dart';
import '../../../../../widgets/card_widget.dart';
import '../../../../book_truck/book_truck_screen.dart';

class DealsWidget extends StatelessWidget {
  const DealsWidget({
    Key? key,
    required this.cards,
  }) : super(key: key);

  final List<TruckModel> cards;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: cards.length,
      padding: const EdgeInsets.only(left: 16),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookTruckScreen(
                          car: cards[index])),
                );
              },
              child: buildTruckCard(cards[index])),
        );
      },
    );
  }
}

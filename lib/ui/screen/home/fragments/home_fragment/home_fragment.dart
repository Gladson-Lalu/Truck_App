import 'package:flutter/material.dart';

import '../../../../../data/model/dealer_model.dart';
import '../../../../../data/model/truck_model.dart';
import '../../../../config/constants.dart';
import '../../../../config/data.dart';
import '../../../available_trucks/available_trucks_screen.dart';
import 'widgets/dealer_widget.dart';
import 'widgets/deals_widget.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({Key? key}) : super(key: key);

  final List<TruckModel> cars = getCarList();
  final List<Dealer> dealers = getDealerList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your Tracking Id',
                hintStyle: const TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.only(
                  left: 30,
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(
                      right: 24.0, left: 16.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LORRY MARKET ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "view all",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 280,
                    child: DealsWidget(
                      cards: cars,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AvailableTrucksScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, right: 16, left: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius:
                              const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        padding: const EdgeInsets.all(24),
                        height: 100,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Available Trucks",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight:
                                        FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Long and short distance transportation",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration:
                                  const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: 50,
                              width: 50,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LOAD MARKET",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "view all",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    margin:
                        const EdgeInsets.only(bottom: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dealers.length,
                      itemBuilder: (BuildContext context,
                          int index) {
                        return buildDealer(
                            dealers[index], index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

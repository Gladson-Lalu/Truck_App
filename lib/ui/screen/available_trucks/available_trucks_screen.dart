import '../../widgets/card_widget.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../config/data.dart';
import '../book_truck/book_truck_screen.dart';

class AvailableTrucksScreen extends StatefulWidget {
  const AvailableTrucksScreen({Key? key}) : super(key: key);

  @override
  _AvailableTrucksScreenState createState() =>
      _AvailableTrucksScreenState();
}

class _AvailableTrucksScreenState
    extends State<AvailableTrucksScreen> {
  List<String> filters = [
    "Best Match",
    "Lowest Price",
    "Highest Price",
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 28,
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Available Trucks (" +
                    getCarList().length.toString() +
                    ")",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: getCarList().length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookTruckScreen(
                              car: getCarList()[index],
                            ),
                          ),
                        );
                      },
                      child: buildTruckCard(
                          getCarList()[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(children: [
          Container(
            width: 50,
            height: 50,
            margin:
                const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.filter_list,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding:
                  const EdgeInsets.symmetric(vertical: 24),
              physics: const BouncingScrollPhysics(),
              itemCount: filters.length,
              itemBuilder:
                  (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 0),
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    color: selectedFilter == filters[index]
                        ? kPrimaryColor
                        : Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(
                      color:
                          selectedFilter == filters[index]
                              ? kPrimaryColor
                              : Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filters[index];
                        });
                      },
                      child: Text(
                        filters[index],
                        style: TextStyle(
                          color: selectedFilter ==
                                  filters[index]
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ]),
      ),
    );
  }
}

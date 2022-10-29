import '../widgets/car_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../config/constants.dart';
import '../config/data.dart';
import 'book_truck_screen.dart';

class AvailableTrucksScreen extends StatefulWidget {
  const AvailableTrucksScreen({Key? key}) : super(key: key);

  @override
  _AvailableTrucksScreenState createState() =>
      _AvailableTrucksScreenState();
}

class _AvailableTrucksScreenState
    extends State<AvailableTrucksScreen> {
  List<Filter> filters = getFilterList();
  late Filter selectedFilter;

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
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.55,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: getCarList().map((item) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BookTruckScreen(
                                        car: item)),
                          );
                        },
                        child: buildCar(item, 0));
                  }).toList(),
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
        child: Row(
          children: [
            buildFilterIcon(),
            Row(
              children: buildFilters(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterIcon() {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }

  List<Widget> buildFilters() {
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
    }
    return list;
  }

  Widget buildFilter(Filter filter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter
                ? kPrimaryColor
                : Colors.grey[300],
            fontSize: 16,
            fontWeight: selectedFilter == filter
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(
      DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Filter>(
        'selectedFilter', selectedFilter));
  }
}

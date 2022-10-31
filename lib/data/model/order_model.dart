class OrderModel {
  final String? id;
  final String? truckId;
  final String modelNumber;
  final String brand;
  final DateTime date;
  final String totalAmount;
  final String imageUrl;

  OrderModel({
    this.id,
    this.truckId,
    required this.modelNumber,
    required this.brand,
    required this.date,
    required this.totalAmount,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'truckId': truckId,
      'modelNumber': modelNumber,
      'brand': brand,
      'date': date,
      'totalAmount': totalAmount,
      'imageUrl': imageUrl,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      truckId: map['truckId'],
      modelNumber: map['modelNumber'],
      brand: map['brand'],
      date: map['date'].toDate(),
      totalAmount: map['totalAmount'],
      imageUrl: map['imageUrl'],
    );
  }
}

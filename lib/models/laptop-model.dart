class LaptopModel {
  String name;
  int price;
  DateTime dateCreated;
  LaptopModel({this.name, this.price, this.dateCreated});
  @override
  String toString() {
    return 'Name: ${this.name} | Price: ${this.price}';
  }
}

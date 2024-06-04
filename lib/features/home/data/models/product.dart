import 'package:ar_shopping/features/home/data/models/category.dart';

class Product {
  final String name;
  final List<String> imageUrls;
  final double cost;
  final String? description;
  final List<String>? sizes;

  /// Which overall category this product belongs in. e.g - Men, Women, Pets, etc.
  final Category category;

  /// Represents type of product such as shirt, jeans, pet treats, etc.
  final String productType;

  Product(
      {required this.name,
      required this.imageUrls,
      required this.cost,
      this.description,
      this.sizes,
      required this.category,
      required this.productType});
}

List<ProductModel> products = [];
// [
//   Product(
//     name: 'Pack Crewneck chair - Black',
//     imageUrls: [
//       'https://comfortel.co.uk/wp-content/uploads/1-Boho-Salon-Furniture-Interior-Design-Salon-1.jpg',
//       'https://i.pinimg.com/originals/b6/59/ff/b659ff0510f4beb5bf22a77916389211.jpg'
//     ],
//     cost: 12.99,
//     category: mensCategory,
//     productType: 'chair',
//     sizes: [
//       'small',
//       'mediam',
//     ],
//   ),
//   Product(
//     name: 'Short chair',
//     imageUrls: [
//       'https://ledworld.com.au/wp-content/uploads/2018/08/LEDWorldParisRoseHairArtistrySalon05-1030x688.jpg',
//       'https://ledworld.com.au/wp-content/uploads/2018/11/Paris-Rose-Hair-Salon-3-599x374.jpg',
//       'https://ledworld.com.au/wp-content/uploads/2018/08/LEDWorldParisRoseHairArtistrySalon15.jpg',
//       'https://hendrxhair.co/wp-content/uploads/2018/04/ISKA_028.jpg'
//     ],
//     cost: 17.99,
//     category: mensCategory,
//     productType: 'chair',
//     sizes: [
//       'small',
//       'mediam',
//       'large',
//     ],
//   ),
//   Product(
//     name: 'nice chair ',
//     imageUrls: [
//       'https://hendrxhair.co/wp-content/uploads/2018/04/ISKA_028.jpg',
//       'https://th.bing.com/th/id/OIP.61lUdJM2AHdyM8stuiLG3AHaE7?w=1024&h=682&rs=1&pid=ImgDetMain',
//     ],
//     cost: 24.99,
//     category: mensCategory,
//     productType: 'chair',
//     sizes: [
//       'small',
//       'mediam',
//       'large',
//     ],
//   ),
//   Product(
//     name: 'An ashdb',
//     imageUrls: [
//       'https://jacksonmediahome.files.wordpress.com/2018/12/tabel-2.png',
//       'https://th.bing.com/th/id/OIP.kbn5ulqN5fauA7NsBxSiHgHaHa?w=1000&h=1000&rs=1&pid=ImgDetMain',
//     ],
//     cost: 29.99,
//     category: mensCategory,
//     productType: 'tabel',
//     sizes: [],
//   ),
//   Product(
//     name: "mab lab lis",
//     imageUrls: [
//       'https://th.bing.com/th/id/OIP.uqp9Ye_hdV6p5laTBED0egHaFW?rs=1&pid=ImgDetMain',
//       'https://th.bing.com/th/id/OIP.BWGDkj-1RRpNmsCINSOrsAHaHa?w=2000&h=2000&rs=1&pid=ImgDetMain',
//     ],
//     cost: 39.99,
//     category: mensCategory,
//     productType: 'tabel',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: "hard wood",
//     imageUrls: [
//       'https://i.pinimg.com/originals/f0/35/48/f03548e2d5fe7b7868a57e1e5e366216.jpg',
//       'https://th.bing.com/th/id/OIP.bvTCDN7QzeSIC5vvLs7lwQHaF7?w=1273&h=1018&rs=1&pid=ImgDetMain',
//       'https://th.bing.com/th/id/OIP.PjK5OPosy0ahbfaeZPqhAAAAAA?w=400&h=400&rs=1&pid=ImgDetMain',
//     ],
//     cost: 39.99,
//     category: mensCategory,
//     productType: 'tabel',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: "mni's Original ",
//     imageUrls: [
//       'https://th.bing.com/th/id/OIP.PjK5OPosy0ahbfaeZPqhAAAAAA?w=400&h=400&rs=1&pid=ImgDetMain',
//       'https://i.pinimg.com/originals/f0/35/48/f03548e2d5fe7b7868a57e1e5e366216.jpg',
//       'https://th.bing.com/th/id/OIP.bvTCDN7QzeSIC5vvLs7lwQHaF7?w=1273&h=1018&rs=1&pid=ImgDetMain',
//     ],
//     cost: 39.99,
//     category: mensCategory,
//     productType: 'tabel',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: '2-Pack Performance Shorts',
//     imageUrls: [
//       'https://th.bing.com/th/id/OIP.FW2z_iMEgYgHPVMTMlMwwQAAAA?pid=ImgDet&w=400&h=400&rs=1'
//     ],
//     cost: 19.99,
//     category: mensCategory,
//     productType: 'antray',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: "Levi's Cargo Shorts",
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/915Io2JEUPL._AC_UX679_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/91WJgn0FNkL._AC_UX679_.jpg',
//     ],
//     cost: 29.99,
//     category: mensCategory,
//     productType: 'shorts',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: '2-Pack Short-Sleeve Crewneck',
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/911mb8PkHSL._AC_UX522_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/81LDpImWPAL._AC_UX522_.jpg',
//     ],
//     cost: 16.99,
//     category: womensCategory,
//     productType: 'shirts',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: 'Waffle Knit Tunic Blouse',
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/71lDML8KDQL._AC_UX522_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/61Ojm-DnojL._AC_UY679_.jpg',
//     ],
//     cost: 22.99,
//     category: womensCategory,
//     productType: 'shirts',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: 'Mid-Rise Skinny Jeans',
//     imageUrls: [
//       //TODO links not working returning null
//       'https://images-na.ssl-images-amazon.com/images/I/71canaWSlAL._AC_UX522_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/71zLzCwbXUL._AC_UX522_.jpg',
//     ],
//     cost: 28.99,
//     category: womensCategory,
//     productType: 'jeans',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: "Levi's Straight 505 Jeans",
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/51D4eXuwKaL._AC_UX679_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/51sHwN6mDzL._AC_UX679_.jpg',
//     ],
//     cost: 34.99,
//     category: womensCategory,
//     productType: 'jeans',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: "Levi's 715 Bootcut Jeans",
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/81QwSgeXHTL._AC_UX522_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/81qmkt1Be0L._AC_UY679_.jpg',
//     ],
//     cost: 34.99,
//     category: womensCategory,
//     productType: 'jeans',
//     sizes: ['XS', 'S', 'M', 'L', 'XL'],
//   ),
//   Product(
//     name: '3-Pack - Squeaky Plush Dog Toy',
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/712YaF31-3L._AC_SL1000_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/71K1NzmHCfL._AC_SL1000_.jpg',
//     ],
//     cost: 9.99,
//     category: petsCategory,
//     productType: 'toys',
//   ),
//   Product(
//     name: 'Wobble Wag Giggle Ball',
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/81XyqDXVwCL._AC_SX355_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/81Ye9KrP3pL._AC_SY355_.jpg',
//     ],
//     cost: 11.99,
//     category: petsCategory,
//     productType: 'toys',
//   ),
//   Product(
//     name: 'Duck Hide Twists',
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/51dS9c0xIdL._SX342_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/81z4lvRtc5L._SL1500_.jpg',
//     ],
//     cost: 8.99,
//     category: petsCategory,
//     productType: 'treats',
//   ),
//   Product(
//     name: "Zuke's Mini Training Treats",
//     imageUrls: [
//       'https://images-na.ssl-images-amazon.com/images/I/81LV2CHtGKL._AC_SY355_.jpg',
//       'https://images-na.ssl-images-amazon.com/images/I/81K30Bs9C6L._AC_SY355_.jpg',
//     ],
//     cost: 10.99,
//     category: petsCategory,
//     productType: 'treats',
//   ),
// ];

Category mensCategory = Category(title: 'sallon', selections: [
  'chair',
  'tabel',
  'antray',
]);
Category womensCategory = Category(title: 'bed room', selections: [
  'Shirts',
  'Jeans',
]);
Category petsCategory = Category(title: 'live room ', selections: [
  'Toys',
  'Treats',
]);

class ProductModel {
  String? pcId;
  String? pcName;
  String? pcType;
  String? description;
  String? price;
  String? img;
  String? img2;
  String? obj;
  String? discount;
  String? lenght;
  String? width;
  String? hight;
  List<String>? sizes;
  ProductModel(
      {this.pcId,
      this.pcName,
      this.pcType,
      this.description,
      this.price,
      this.img,
      this.img2,
      this.obj,
      this.discount,
      this.lenght,
      this.width,
      this.hight});

  ProductModel.fromJson(Map<String, dynamic> json) {
    pcId = json["pc_id"] ?? '';
    pcName = json["pc_name"] ?? '';
    pcType = json["pc_type"] ?? '';
    description = json["description"] ?? '';
    price = json["price"] ?? '';
    img = json["img"];
    img2 = json["img2"] ?? '';
    obj = json["obj"];
    discount = json["discount"] ?? '';
    lenght = json["lenght"];
    width = json["width"];
    hight = json["hight"];
    sizes = [
      'small',
      'mediam',
      'large',
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["pc_id"] = pcId;
    _data["pc_name"] = pcName;
    _data["pc_type"] = pcType;
    _data["description"] = description;
    _data["price"] = price;
    _data["img"] = img;
    _data["img2"] = img2;
    _data["obj"] = obj;
    _data["discount"] = discount;
    _data["lenght"] = lenght;
    _data["width"] = width;
    _data["hight"] = hight;
    return _data;
  }
}

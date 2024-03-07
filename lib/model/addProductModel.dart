class addProductModel {
  final String company;
  final String brand;
  final List<String> brandImages;
  final String product;
  final String characteristi;
  final List<String> productImages;
  final List<String> genders;
  final List<String> ages;
  final List<String> range;

  addProductModel({
    required this.company,
    required this.brand,
    required this.brandImages,
    required this.product,
    required this.characteristi,
    required this.productImages,
    required this.genders,
    required this.ages,
    required this.range,
  });

  factory addProductModel.fromJson(Map<String, dynamic> json) {
    return addProductModel(
      company: json['company'],
      brand: json['brand'],
      brandImages: json['brandImages'],
      product: json['product'],
      characteristi: json['characteristi'],
      productImages: json['productImages'],
      genders: json['genders'],
      ages: json['ages'],
      range: json['range'],
    );
  }
}

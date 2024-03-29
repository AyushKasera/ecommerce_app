class Clothes {
  String? productName;
  String? price;
  String? imageUrl;

  Clothes(
    this.productName,
    this.price,
    this.imageUrl,
  );
  static List<Clothes> generateClothes() {
    return [
      Clothes(
        'Gucci oversize',
        '\$70.99',
        'assets/images/arrival1.png',
      ),
      Clothes(
        'T-shirt oversize',
        '\$80.99',
        'assets/images/arrival2.png',
      ),
      Clothes(
        'Gucci oversize',
        '\$70.99',
        'assets/images/arrival1.png',
      ),
      Clothes(
        'T-shirt oversize',
        '\$80.99',
        'assets/images/arrival2.png',
      ),
    ];
  }
}

class Flower {
  final String id;
  final String name;
  final int price;
  final String image;
  final String category;
  final String description;
  final double rating;
  final int reviews;

  const Flower({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
    required this.rating,
    required this.reviews,
  });
}

class FlowerCategory {
  final String id;
  final String name;
  final String icon;
  final int color;

  const FlowerCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

class CartItem {
  final Flower flower;
  int quantity;

  CartItem({required this.flower, this.quantity = 1});
}

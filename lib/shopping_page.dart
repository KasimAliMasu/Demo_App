import 'package:demo_app/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'oversizedTShirt'.tr(),
        price: 339.99,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0566/0839/1368/files/2_68870f4c-e1c3-405e-96cc-9d4f2b1c604f.png?v=1713008021&width=500',
      ),
      Product(
        name: 'oversizedTShirt'.tr(),
        price: 589.99,
        imageUrl:
            'https://overlaysnow.com/cdn/shop/files/BeigeChampionPhoto_4.jpg?v=1713004590&width=1000',
      ),
      Product(
        name: 'clothingForMen'.tr(),
        price: 3219.99,
        imageUrl:
            'https://rukminim2.flixcart.com/image/832/832/xif0q/t-shirt/c/b/g/l-aa-puff02-antayul-apparel-original-imagxty3xymcyrz4.jpeg?q=70&crop=false',
      ),
      Product(
        name: 'oversizedTShirt'.tr(),
        price: 3219.99,
        imageUrl:
            'https://www.fugazee.com/cdn/shop/files/11-09-2315027.jpg?v=1699749767&width=640',
      ),
      Product(
        name: 'oversizedTShirt'.tr(),
        price: 3319.99,
        imageUrl:
            'https://overlaysnow.com/cdn/shop/files/OVERLAYS1029.jpg?v=1718355268&width=1000',
      ),
      Product(
        name: 'clothingForMen'.tr(),
        price: 919.99,
        imageUrl:
            'https://overlaysnow.com/cdn/shop/files/OVERLAYS068_bf8480c7-ff60-4fc1-8495-64107c63a8ca.jpg?v=1718988730&width=1300',
      ),
      Product(
        name: 'clothingForMen'.tr(),
        price: 989.99,
        imageUrl:
            'https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1710851907_9370993.jpg?format=webp&w=480&dpr=1.5',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearch(products),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_sharp,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageScreen(
              imageUrl: product.imageUrl,
              name: product.name,
              price: product.price,
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Hero(
                  tag: product.imageUrl,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '₹ ${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSearch extends SearchDelegate<Product> {
  final List<Product> products;

  ProductSearch(this.products);

  final Product defaultProduct =
      Product(name: 'Default Product', price: 1, imageUrl: '');

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, defaultProduct);
      },
    );
  }

  @override
  void close(BuildContext context, Product product) {
    Navigator.pop(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.75,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ProductItem(product: results[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          title: Text(product.name),
          onTap: () {
            query = product.name;
            showResults(context);
          },
        );
      },
    );
  }
}

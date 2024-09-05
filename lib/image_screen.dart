// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageScreen extends StatefulWidget {
  final String imageUrl, name;
  final double price;

  const ImageScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String selectedSize = 'M';
  bool isLoading = false;
  bool isSharing = false;

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  Future<void> _launchURL(String url) async {
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('goToImageUploadPage'.tr),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          if (isLoading) const LinearProgressIndicator(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ClipRRect(
                      child: Hero(
                        tag: widget.imageUrl,
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconButton(
                              onPressed: () async {
                                if (!isSharing) {
                                  setState(() {
                                    isSharing = true;
                                  });

                                  await Share.share(
                                      'https://play.google.com/store/search?q=pub%3ADivTag&c=apps');
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  setState(() {
                                    isSharing = false;
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.share_rounded,
                                color: Colors.black,
                              ),
                            ),
                            if (isSharing) const CircularProgressIndicator(),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'comfortableMaterial'.tr,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '₹ ${widget.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Text(
                          'size'.tr,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 20,
                      color: Colors.grey,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: sizes.map((size) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ChoiceChip(
                              label: Text(size),
                              selected: selectedSize == size,
                              onSelected: (selected) {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Divider(
                      height: 20,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Text(
                          'productDetails'.tr,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'product_description'.tr,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'product_care'.tr,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'product_care_description'.tr,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'contact_us'.tr,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FlutterSocialButton(
                            onTap: () =>
                                _launchURL('mailto:kasimalimasu@gmail.com'),
                            mini: true,
                            buttonType: ButtonType.email,
                          ),
                          const SizedBox(width: 10),
                          FlutterSocialButton(
                            onTap: () => _launchURL('tel:+9409274467'),
                            mini: true,
                            buttonType: ButtonType.phone,
                          ),
                          const SizedBox(width: 10),
                          FlutterSocialButton(
                            onTap: () => _launchURL('https://wa.me/9409274467'),
                            mini: true,
                            buttonType: ButtonType.whatsapp,
                          ),
                          const SizedBox(width: 10),
                          FlutterSocialButton(
                            onTap: () => _launchURL('https://facebook.com'),
                            mini: true,
                            buttonType: ButtonType.facebook,
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.instagram),
                            onPressed: () =>
                                _launchURL('https://instagram.com'),
                            iconSize: 60.0,
                            color: const Color(0xFFC13584),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {},
                  child: Text(
                    'buy_this_product'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {},
                  child: Text(
                    'add_to_cart'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

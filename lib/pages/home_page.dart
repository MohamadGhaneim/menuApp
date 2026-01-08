import 'package:flutter/material.dart';
import 'package:menuapp/components/app_card_item.dart';
import 'package:menuapp/components/app_cercel_titel.dart';
import 'package:menuapp/components/app_image.dart';
import 'package:menuapp/components/app_onboarding_carousel.dart';
import 'package:menuapp/components/app_text_button.dart';
import 'package:menuapp/config/app_routes.dart';
import 'package:menuapp/util/providers/category_provider.dart';
import 'package:menuapp/util/providers/offer_provider.dart';
import 'package:menuapp/util/providers/product_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchControl = TextEditingController();
  late CategoryProvider categoryProvider;
  late OfferProvider offerProvider;
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    offerProvider = Provider.of<OfferProvider>(context, listen: false);
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    categoryProvider.loadCategoryJson();
    productProvider.loadDiscountedProducts('assets/data/product.json');
    productProvider.loadProducts('assets/data/product.json');
  }

  @override
  Widget build(BuildContext context) {
    final category = context.watch<CategoryProvider>().items;
    final loadImages = context.watch<OfferProvider>().images;
    final loadProducts = context.watch<ProductProvider>().products;
    final loadDiscountedProducts =
        context.watch<ProductProvider>().discountedProducts;

    //offeres
    List<AppImage> appImageItems =
        loadImages.map((e) => AppImage(imagePath: e.imagePath)).toList();

    //Products
    List<AppCardItem> appCardProducts =
        loadProducts.map((product) {
          return AppCardItem(
            imagePath: product.imagePath,
            title: product.title,
            description: product.description,
            price: product.price,
            pldPrice: product.oldPrice,
          );
        }).toList();

    //Discounted products
    List<AppCardItem> appCardDiscountedProducts =
        loadDiscountedProducts.map((product) {
          return AppCardItem(
            imagePath: product.imagePath,
            title: product.title,
            description: product.description,
            price: product.price,
            pldPrice: product.oldPrice,
          );
        }).toList();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.blue,

          title: TextField(
            controller: searchControl,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(height: 100, color: Colors.blue),
                    AppOnboardingCarousel(
                      items: appImageItems,
                      screenHeight: 160,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppTextButton(
                    text: 'Top categories!',
                    color: Colors.blue,
                    fontSize: 18,
                    onPressed: () {},
                  ),
                ),
                // list of appCercels with border blue and scrollable horizontally
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 5),
                    itemBuilder: (context, index) {
                      return AppCercelTitel(
                        imagePath: category[index].imagePath,
                        description: category[index].description,
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppTextButton(
                        text: 'Great Deals! 🔥',
                        color: Colors.blue,
                        fontSize: 18,
                        onPressed: () {},
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.login);
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: appCardProducts.length,
                    itemBuilder: (context, index) {
                      return appCardProducts[index];
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppTextButton(
                        text: 'Back in stock! 🔥',
                        color: Colors.blue,
                        fontSize: 18,
                        onPressed: () {},
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: appCardDiscountedProducts.length,
                    itemBuilder: (context, index) {
                      return appCardDiscountedProducts[index];
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 5),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

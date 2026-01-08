import 'package:flutter/material.dart';
import 'package:menuapp/components/app_add_to_card.dart';

class AppCardItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final double pldPrice;

  const AppCardItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.pldPrice,
  });

  @override
  State<AppCardItem> createState() => _AppCardItemState();
}

class _AppCardItemState extends State<AppCardItem> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool liked = true;

    // rectange container with border radius 10 and shadow , has image at the top and text at the bottom
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: screenWidth * 0.4,
      height: screenHeight * 0.25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.imagePath),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      icon: Icon(color: Colors.red, Icons.favorite, size: 20),
                      onPressed:
                          () => {
                            setState(() {
                              liked = !liked;
                            }),
                          },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.description,
              style: TextStyle(fontSize: 10, color: Colors.grey),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                // old price and new price
                Text(
                  '\$${widget.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 5),
                if (widget.pldPrice > 0)
                  Text(
                    '\$${widget.pldPrice}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 109, 105, 105),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),

            AppAddToCard(
              onPressed: () => {},
              text: 'add to card',
              bgColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

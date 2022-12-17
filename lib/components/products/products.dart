import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final String title;
  final int price;
  final String description;
  final List image;
  const Products(this.title, this.price, this.description, this.image,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/eachproduct', arguments: {
                'title': title,
                'price': price,
                'description': description,
                'image': image
              });
            },
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                        width: 280,
                        height: 200,
                        child: Image.network(image[0])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          'R\$ ${price.toString()},00',
                          style: const TextStyle(
                              fontSize: 23, color: Colors.green),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

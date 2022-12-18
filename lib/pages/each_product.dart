import 'package:flutter/material.dart';
import 'package:store/components/appBar/app_bar.dart';
import 'package:store/components/eachProducts/carousel/carousel.dart';

class EachProduct extends StatelessWidget {
  const EachProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
        appBar: const AppBarDesign(),
        body: SizedBox(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    arg['title'],
                    style: const TextStyle(fontSize: 20),
                  ),
                  CarouselEachProduct(arg['image']),
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(arg['description'])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Add to cart')),
                      Text(
                        'R\$ ${arg['price'].toString()},00',
                        style:
                            const TextStyle(color: Colors.green, fontSize: 30),
                      ),
                    ],
                  )
                ])));
  }
}

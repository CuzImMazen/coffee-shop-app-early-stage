import 'package:coffe_shop/Components/HomeBody_Components/Widgets/promo_container.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class PromoListView extends StatelessWidget {
  const PromoListView({super.key});
  final Promos = const [
    PromoContainer(image: 'assets/images/promo2.jpg'),
    PromoContainer(image: 'assets/images/promo3.jpg'),
    PromoContainer(image: 'assets/images/promo4.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 160,
      child: InfiniteCarousel.builder(
        loop: true,
        itemExtent: 330,
        itemCount: Promos.length,
        itemBuilder: (context, itemindex, realindex) => Promos[itemindex],
      ),
    );
  }
}

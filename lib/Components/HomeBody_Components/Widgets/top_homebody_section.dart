import 'package:coffe_shop/Components/HomeBody_Components/Widgets/homebody_top_container.dart';
import 'package:coffe_shop/Components/HomeBody_Components/Widgets/promo_listview.dart';
import 'package:flutter/material.dart';

class TopHomeBodySection extends StatelessWidget {
  const TopHomeBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390,
      child: Stack(
        children: [
          HomeBodyTopContainer(),
          Positioned(
            left: 30,
            top: 200,
            child: PromoListView(),
            //
          ),
        ],
      ),
    );
  }
}

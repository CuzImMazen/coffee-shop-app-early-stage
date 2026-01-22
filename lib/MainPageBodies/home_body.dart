import 'package:coffe_shop/Components/HomeBody_Components/Widgets/category_listview.dart';
import 'package:coffe_shop/Components/HomeBody_Components/Widgets/product_stream_grid.dart';
import 'package:coffe_shop/Components/HomeBody_Components/Widgets/top_homebody_section.dart';
import 'package:coffe_shop/cubits/FavoriteCubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController scrollController = ScrollController();
  int activeCategoryIndex = 0;
  void toggleTab(int index) {
    setState(() {
      activeCategoryIndex = index;
      scrollController.jumpTo(0);
    });
  }

  @override
  void initState() {
    context.read<FavoriteCubit>().initFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopHomeBodySection(),
        CategoryListView(
          toggleTab: toggleTab,
          activeCategoryIndex: activeCategoryIndex,
        ),
        SizedBox(height: 20),
        ProductStreamGridView(
          categoryIndex: activeCategoryIndex,
          scrollController: scrollController,
        ),
      ],
    );
  }
}

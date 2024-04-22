import 'dart:math';

import 'package:e_com_app/bloc/Categories/categories_bloc.dart';
import 'package:e_com_app/bloc/products/product_bloc.dart';
import 'package:e_com_app/repos/models/products_model.dart';
import 'package:e_com_app/resources/customcard.dart';
import 'package:e_com_app/resources/maths.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductBloc _productBloc = ProductBloc();
  final CategoriesBloc _categoriesBloc = CategoriesBloc();

  @override
  void initState() {
    _categoriesBloc.add(LoadCategoryEvent());
    _productBloc.add(LoadProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Hellow!'),
          ),
          SliverToBoxAdapter(
            child: Card(
              child: Text('Hellow'),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Container(height: 670, child: buildBloc()),
              SizedBox(
                height: 16,
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget buildBloc() {
    return Container(
      child: BlocProvider(
        create: (_) => _productBloc,
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInitial) {
                return CircularProgressIndicator();
              } else if (state is ProductLoading) {
                return CircularProgressIndicator();
              } else if (state is ProductError) {
                return AlertDialog(
                  title: Text(e.toString()),
                );
              } else if (state is ProductLoaded) {
                return _buildCard(context, state.products);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Products model) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: model.products!.length,
        itemBuilder: (context, index) {
          final String title = model.products![index].title!;
          final int price = model.products![index].price!;
          final String rating = model.products![index].rating.toString();
          final int discountpercent =
              model.products![index].discountPercentage!.toInt();
          final String image = model.products![index].thumbnail!;
          final double abc = calculatePrice(discountpercent, price);
          final String efg = abc.toInt().toString();
          final String discountedprice = efg;
          return CustomCard(
              name: title,
              discountPercent: discountpercent,
              discountedprice: discountedprice,
              image: image,
              price: price,
              rating: rating);
        });
  }
}

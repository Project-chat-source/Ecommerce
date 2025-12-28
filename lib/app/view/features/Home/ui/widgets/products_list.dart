import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/app/global/enums/blocstatus.dart';
import 'package:learning/app/view/features/Home/domain/entities/product_response_entities.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_bloc.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_state.dart';
import 'package:learning/app/view/features/Home/ui/widgets/product_card.dart';

class ProductsList extends StatelessWidget {
  final ProductResponseEntities products;
  final ScrollController scrollController;

  const ProductsList({
    super.key,
    required this.products,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    bool isDesktop = width > 768;
    bool isTablet = width <= 768 && width >= 450;

    return BlocConsumer<HomePageBloc, HomePageState>(
      buildWhen: (prev, curr) => prev.productStatus != curr.productStatus,
      listener: (context, state) {
        if (state.productStatus == Blocstatus.isFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state.productStatus == Blocstatus.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.productStatus == Blocstatus.isSuccess) {
          final products = state.products.products;

          if (products.isEmpty) {
            return const Center(child: Text('No Products Found'));
          }

          return GridView.builder(
            physics: BouncingScrollPhysics(),
            cacheExtent: 800,
            addRepaintBoundaries: true,
            controller: scrollController,
            addAutomaticKeepAlives: true,
            padding: const EdgeInsets.all(12),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop
                  ? 3
                  : isTablet
                  ? 2
                  : 1,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
              mainAxisExtent: 400,
            ),
            itemBuilder: (context, index) {
              final product = products[index];

              return RepaintBoundary(
                child: ProductCard(product: product.toDomain()),
              );
            },
          );
        }

        if (state.productStatus == Blocstatus.isFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return const SizedBox.shrink();
      },
    );
  }
}

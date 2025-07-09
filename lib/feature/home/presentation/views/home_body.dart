import 'package:clean_arxitekture/core/service/di.dart';
import 'package:clean_arxitekture/feature/home/presentation/views/carusel.dart';
import 'package:clean_arxitekture/feature/product/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final ProductsBloc _productsBloc;

  @override
  void initState() {
    super.initState();
    _productsBloc = sl<ProductsBloc>()..add(ProductsFetchEvent());
  }

  @override
  void dispose() {
    _productsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(height: 10),
            Carusel(),
            Text(
              "Ommabop kategoryalar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // Bitta BlocProvider ishlatish
            BlocProvider<ProductsBloc>.value(
              value: _productsBloc,
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsFailure) {
                    return _buildErrorWidget();
                  }
                  if (state is ProductsSuccess) {
                    return _buildCategoriesSection(state);
                  }
                  return _buildLoadingWidget();
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tavsiya etilgan mahsulotlar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    if (mounted) {
                      context.push('/home/all-products');
                    }
                  },
                  child: Text("Xammasi", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),

            // Bir xil BlocProvider ishlatish
            BlocProvider<ProductsBloc>.value(
              value: _productsBloc,
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsFailure) {
                    return _buildErrorWidget();
                  }
                  if (state is ProductsSuccess) {
                    return _buildRecommendedSection(state);
                  }
                  return _buildLoadingWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection(ProductsSuccess state) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: state.data.data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = state.data.data[index];
          return _buildCategoryItem(data, state);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 12);
        },
      ),
    );
  }

  Widget _buildRecommendedSection(ProductsSuccess state) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        itemCount: state.data.data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = state.data.data[index];
          return _buildRecommendedItem(data, state);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 12);
        },
      ),
    );
  }

  Widget _buildCategoryItem(dynamic data, ProductsSuccess state) {
    return GestureDetector(
      onTap: () => _navigateToProduct(state),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Text(
              data.nameUz ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 120, child: _buildNetworkImage(data)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedItem(dynamic data, ProductsSuccess state) {
    return GestureDetector(
      onTap: () => _navigateToProduct(state),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            SizedBox(height: 120, child: _buildNetworkImage(data)),
            Text(data.nameUz ?? ''),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.price ?? ''),
                IconButton(
                  onPressed: () => _addToCart(data),
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNetworkImage(dynamic data) {
    return Image.network(
      data.images != null && data.images.isNotEmpty
          ? data.images[0].image ?? ''
          : '',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(color: Colors.grey[300], child: Icon(Icons.error));
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value:
                loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
          ),
        );
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(child: CircularProgressIndicator(color: Colors.red));
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 50, color: Colors.red),
          SizedBox(height: 10),
          Text("Xatolik yuz berdi"),
          ElevatedButton(
            onPressed: () {
              _productsBloc.add(ProductsFetchEvent());
            },
            child: Text("Qayta urinish"),
          ),
        ],
      ),
    );
  }

  void _navigateToProduct(ProductsSuccess state) {
    if (mounted) {
      // StatefulShellRoute ichidagi sub-route ishlatish
      context.push('/home/product', extra: state.data);
    }
  }

  void _addToCart(dynamic data) {
    if (mounted) {
      // Savatga qo'shish logikasi
      print("Savatga qo'shildi: ${data.nameUz}");

      // Snackbar ko'rsatish
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${data.nameUz} savatga qo'shildi"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

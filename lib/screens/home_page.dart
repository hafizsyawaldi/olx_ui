import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Product> _dummyProducts() {
    return const [
      Product(
        id: 'p1',
        name: 'iPhone 13 128GB',
        location: 'Kramatjati, Jakarta Timur',
        price: 8750000,
        imageAsset: 'assets/images/phone.jpg',
        isNew: false,
      ),
      Product(
        id: 'p2',
        name: 'Sepeda Lipat Polygon',
        location: 'Depok, Jawa Barat',
        price: 2100000,
        imageAsset: 'assets/images/bike.jpg',
        isNew: false,
      ),
      Product(
        id: 'p3',
        name: 'Laptop Acer Swift 3',
        location: 'Jakarta Pusat',
        price: 9700000,
        imageAsset: 'assets/images/laptop.jpg',
        isNew: true,
      ),
      Product(
        id: 'p4',
        name: 'Kursi Gaming Rexus',
        location: 'Bekasi, Jawa Barat',
        price: 1250000,
        imageAsset: 'assets/images/chair.jpg',
        isNew: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final products = _dummyProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth >= 700;
            if (isTablet) {
              final crossCount = constraints.maxWidth >= 1000 ? 3 : 2;
              return GridView.builder(
                padding: const EdgeInsets.only(bottom: 12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossCount,
                  childAspectRatio: 3.4,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    onTap: () => _showDetail(context, product),
                  );
                },
              );
            } else {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    onTap: () => _showDetail(context, product),
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite_outline), label: 'Favorit'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Akun'),
        ],
        selectedIndex: 0,
        onDestinationSelected: (i) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tab $i belum aktif.')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tambah iklan belum aktif.')),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Pasang iklan'),
      ),
    );
  }

  void _showDetail(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'product_${product.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product.imageAsset,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                    tooltip: 'Tutup',
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(product.location),
              const SizedBox(height: 8),
              Text(
                'Detail fitur belum diimplementasi (UI-only).',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}

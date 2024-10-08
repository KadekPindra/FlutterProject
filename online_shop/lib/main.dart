import 'package:flutter/material.dart';
import 'productDetail.dart';

void main() {
  runApp(HustlePerfume());
}

class HustlePerfume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hustle Perfume',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    ProductsPage(),
    ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(
          'Temukan Produk Kami',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Black Opium Perfume',
      'description': 'Limonene, Coumarin, Linalool...',
      'image': 'assets/images/black.png',
    },
    {
      'name': 'Vannila Ice Perfume',
      'description': 'Limonene, Coumarin, Linalool...',
      'image': 'assets/images/vanila.png',
    },
    {
      'name': 'Eros Perfume',
      'description': 'Limonene, Coumarin, Linalool...',
      'image': 'assets/images/eros.png',
    },
    {
      'name': 'Scandal Perfume',
      'description': 'Limonene, Coumarin, Linalool...',
      'image': 'assets/images/eros.png',
    },
    {
      'name': 'Blue Mist Perfume',
      'description': 'Limonene, Coumarin, Linalool...',
      'image': 'assets/images/blue.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10.0, 
            mainAxisSpacing: 10.0, 
            childAspectRatio: 0.75, 
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(product: product),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15.0),
                        ),
                        child: Image.asset(
                                product['image']!,
                                fit: BoxFit.cover,
                          ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name']!,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            product['description']!,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Text(
          'Profil Saya',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

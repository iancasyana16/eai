import 'dart:convert';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> menuList = [];
  List<dynamic> allMenuList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMenu();
    fetchPopularMenus();
  }

  Future<void> fetchMenu() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/menu'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        allMenuList = data['data'];
        menuList = allMenuList;
      });
    } else {
      print("Failed to load menu: ${response.statusCode}");
    }
  }

  Future<void> fetchPopularMenus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/popular-menus'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        // hanya menuList yang berubah, biarkan allMenuList tetap berisi semua menu
        menuList = data['data'];
      });
    } else {
      print("Gagal mengambil menu populer: ${response.statusCode}");
    }
  }



  // Fungsi untuk filter berdasarkan kategori
  void filterMenu(String kategori) {
    setState(() {
      if (kategori == "Populer") {
        fetchPopularMenus(); // ini akan mengubah menuList ke menu populer
      } else if (kategori == "Semua") {
        menuList = allMenuList;
      } else {
        menuList =
            allMenuList.where((item) {
              return item['category']?.toLowerCase() == kategori.toLowerCase();
            }).toList();
      }
    });
  }

  // Fungsi untuk filter berdasarkan pencarian
  void filterBySearch(String query) {
    setState(() {
      if (query.isEmpty) {
        menuList = allMenuList;
      } else {
        menuList =
            allMenuList.where((item) {
              final name = item['name']?.toLowerCase() ?? '';
              return name.contains(query.toLowerCase());
            }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose controller saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 150,
          backgroundColor: Colors.yellow,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12),
            child: Text(
              'Saung Biung',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            // Search bar
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  filterBySearch(value); // Filter menu berdasarkan pencarian
                },
                onSubmitted: (value) async {
                  final prefs = await SharedPreferences.getInstance();
                  final token = prefs.getString('token');
                  await http.post(
                    Uri.parse('http://127.0.0.1:8000/api/log-search'),
                    headers: {
                      'Authorization': 'Bearer $token',
                      'Content-Type': 'application/json',
                    },
                    body: jsonEncode({'keyword': value}),
                  );
                  // Lakukan pencarian lokal jika ingin
                },
                decoration: InputDecoration(
                  labelText: "Cari Lauk",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Filter buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 16),
                  _buildFilterButton("Populer"),
                  SizedBox(width: 8),
                  _buildFilterButton("Semua"),
                  SizedBox(width: 8),
                  _buildFilterButton("Makanan"),
                  SizedBox(width: 8),
                  _buildFilterButton("Minuman"),
                  SizedBox(width: 16),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Card horizontal scroll
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                color: Colors.yellow,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        menuList.map((item) {
                          return Container(
                            width: 150,
                            margin: EdgeInsets.only(left: 16),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      item['image'] ??
                                          'https://via.placeholder.com/150',
                                      height: 100,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'] ?? 'Tanpa Nama',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Rp${item['price'] ?? 0}',
                                          style: TextStyle(
                                            color: Colors.green[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),

        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.yellow,
          items: [
            CurvedNavigationBarItem(child: Icon(Icons.home), label: 'Home'),
            CurvedNavigationBarItem(
              child: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {},
        ),
      ),
    );
  }

  // Widget untuk filter button
  Widget _buildFilterButton(String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        filterMenu(title);
      },
      child: Text(title),
    );
  }
}

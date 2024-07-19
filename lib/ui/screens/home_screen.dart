import 'package:flutter/material.dart';
import 'package:kmdha/ui/screens/account_screen.dart';
import 'package:kmdha/ui/screens/favorite_screen.dart';
import 'package:kmdha/ui/screens/login_screen.dart';
import 'package:kmdha/ui/widgets/homescreen/location_service.dart';
import '../widgets/homescreen/home_crousel.dart';
import '../widgets/homescreen/products_list.dart';
import '../widgets/homescreen/shop_list.dart';
import '../widgets/search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/homescreen/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final String _name = "Mr. Unknown";
  int selectedTab = 0;

  void onTabChange(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: getBySelectedTab(),
      bottomNavigationBar: BottomNavBar(
        selectedTab: selectedTab,
        onTabChange: onTabChange,
      ),
    );
  }

  Widget getBySelectedTab() {
    if (selectedTab == 1) {
      return const Center(child: Text("KD feed"));
    } else if (selectedTab == 2) {
      return const FavoriteScreen();
    } else if (selectedTab == 3) {
      return AccountScreen();
    } else {
      return kdHome();
    }
  }

  ListView kdHome() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      children: [
        header(),
        const SearchWidget(),
        const HomeCarousel(),
        const Divider(),
        const ProductsList(),
        const Divider(),
        const ShopList(),
      ],
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "Shop Link",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.language),
                ),
                IconButton(
                  tooltip: "Logout",
                  onPressed: () async {
                    SharedPreferences perfs =
                        await SharedPreferences.getInstance();
                    perfs.setBool("isUserLogin", false);
                    if (mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    }
                  },
                  icon: const Icon(Icons.heart_broken),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          "Welcome $_name",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.black54,
          ),
        ),
        const LocationService(),
      ],
    );
  }
}

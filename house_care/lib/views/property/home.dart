import 'package:flutter/material.dart';
import 'package:house_care/constant/color.dart';
import 'detail_page.dart';
import 'wishlist_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> properties = [
    {
      'id': 1,
      'name': 'CRAFTSMAN HOUSE',
      'location': '204 Hawthorne Blvd, Torrance, CA',
      'image': 'assets/images/house-1.jpg',
      'beds': 4,
      'baths': 2,
      'garage': 1,
      'owner': 'Irfan Shams',
      'ownerpic': 'assets/images/irfan.jpg',
      'price': 9990000,
      'details':
          'Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garage. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras.',
      'gallery': [
        'assets/images/gallery-1.png',
        'assets/images/gallery-2.png',
        'assets/images/gallery-3.png',
        'assets/images/gallery-4.png',
      ],
    },
    {
      'id': 2,
      'name': 'RANCH HOME NEW',
      'location': '450 N Avenue Street, Los Angeles',
      'image': 'assets/images/house-2.png',
      'beds': 3,
      'baths': 2,
      'garage': 1,
      'owner': 'Rebecca Tetha',
      'ownerpic': 'assets/images/rebecca.jpg',
      'price': 7990000,
      'details':
          'Completely redone in 2021. 3 bedrooms. 2 bathrooms. 1 garage. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras.',
      'gallery': [
        'assets/images/gallery-1.png',
        'assets/images/gallery-2.png',
        'assets/images/gallery-3.png',
        'assets/images/gallery-4.png',
      ],
    },
    {
      'id': 3,
      'name': 'RANCH HOME OLD',
      'location': '720 Austi Parkway, Las Vegas, NV',
      'image': 'assets/images/house-3.jpg',
      'beds': 1,
      'baths': 1,
      'garage': 1,
      'owner': 'John Doe',
      'ownerpic': 'assets/images/john.jpg',
      'price': 5990000,
      'details':
          'Completely redone in 2021. 1 bedrooms. 1 bathrooms. 1 garage. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras.',
      'gallery': [
        'assets/images/gallery-1.png',
        'assets/images/gallery-2.png',
        'assets/images/gallery-3.png',
        'assets/images/gallery-4.png',
      ],
    },
  ];

  final Set<int> bookmarkedProperties = {};

  void toggleBookmark(int propertyId) {
    setState(() {
      if (bookmarkedProperties.contains(propertyId)) {
        bookmarkedProperties.remove(propertyId);
      } else {
        bookmarkedProperties.add(propertyId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 13,
                            color: greySmallTxtColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Los Angeles, CA",
                          style: TextStyle(
                            fontSize: 14,
                            color: titleColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.bookmark_outline,
                          color: titleColor,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WishlistPage(
                                bookmarkedProperties: properties
                                    .where((property) => bookmarkedProperties
                                        .contains(property['id']))
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Discover Best\nSuitable Property",
                  style: TextStyle(
                    fontSize: 24,
                    color: titleColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          foregroundColor: Colors.white,
                          backgroundColor: blackBtnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "House",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          foregroundColor: customBlackColor,
                          backgroundColor: iconBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "Apartment",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          foregroundColor: customBlackColor,
                          backgroundColor: iconBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "Flat",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          foregroundColor: customBlackColor,
                          backgroundColor: iconBgColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Dormintory",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 12, right: 10, bottom: 0, left: 20),
                child: Text(
                  "Best for you",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 320,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];
                      final isBookmarked =
                          bookmarkedProperties.contains(property['id']);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                property: property,
                                isBookmarked: isBookmarked,
                                onBookmarkToggle: () =>
                                    toggleBookmark(property['id']),
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Card(
                            color: blackBtnColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.asset(
                                    property['image'],
                                    height: 200,
                                    width: 320,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        property['name'],
                                        style: const TextStyle(
                                          color: primaryBgColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        property['location'],
                                        style: const TextStyle(
                                          color: greySmallTxtColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset("assets/images/bed.png"),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${property['beds']} Beds',
                                            style: const TextStyle(
                                              color: greySmallTxtColor,
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Image.asset("assets/images/tub.png"),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${property['baths']} Baths',
                                            style: const TextStyle(
                                              color: greySmallTxtColor,
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Image.asset("assets/images/car.png"),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${property['garage']} Garage',
                                            style: const TextStyle(
                                              color: greySmallTxtColor,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 12, right: 10, bottom: 0, left: 20),
                child: Text(
                  "Nearby your location",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: iconBgColor,
                    boxShadow: const [
                      BoxShadow(
                        color: greyBorderColor,
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: primaryBgColor,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Image.asset(
                          "assets/images/house-1.jpg",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "CRAFTSMAN HOUSE",
                            style: TextStyle(
                              color: titleColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "520, N Btoudry Ave Los Angeles",
                            style: TextStyle(
                              color: customBlackColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/bed.png"),
                              const SizedBox(width: 2),
                              const Text(
                                "4 Beds",
                                style: TextStyle(
                                  color: greyTxtColor,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset("assets/images/tub.png"),
                              const SizedBox(width: 2),
                              const Text(
                                "4 Baths",
                                style: TextStyle(
                                  color: greyTxtColor,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset("assets/images/car.png"),
                              const SizedBox(width: 2),
                              const Text(
                                "1 Garage",
                                style: TextStyle(
                                  color: greyTxtColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

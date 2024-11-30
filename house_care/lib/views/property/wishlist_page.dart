import 'package:flutter/material.dart';
import 'package:house_care/constant/color.dart';

class WishlistPage extends StatelessWidget {
  final List<Map<String, dynamic>> bookmarkedProperties;

  const WishlistPage({super.key, required this.bookmarkedProperties});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wishlist",
                        style: TextStyle(
                          fontSize: 24,
                          color: titleColor,
                          fontWeight: FontWeight.w900,
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
                        Icons.arrow_back_ios_new_outlined,
                        color: titleColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: bookmarkedProperties.isEmpty
                    ? const Center(
                        child: Text('No bookmarked properties yet.'),
                      )
                    : ListView.builder(
                        itemCount: bookmarkedProperties.length,
                        itemBuilder: (context, index) {
                          final property = bookmarkedProperties[index];
                          return Card(
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
                                    height: 250,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            property['name'],
                                            style: const TextStyle(
                                              color: primaryBgColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            property['location'],
                                            style: const TextStyle(
                                              color: greySmallTxtColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/bed.png"),
                                              const SizedBox(width: 5),
                                              Text(
                                                '${property['beds']} Beds',
                                                style: const TextStyle(
                                                  color: greySmallTxtColor,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Image.asset(
                                                  "assets/images/tub.png"),
                                              const SizedBox(width: 5),
                                              Text(
                                                '${property['baths']} Baths',
                                                style: const TextStyle(
                                                  color: greySmallTxtColor,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Image.asset(
                                                  "assets/images/car.png"),
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
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: iconBgColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.bookmark_border,
                                            color: titleColor,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

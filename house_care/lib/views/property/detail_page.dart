import 'package:flutter/material.dart';
import 'package:house_care/constant/color.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> property;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const DetailPage({
    super.key,
    required this.property,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    property['image'],
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property['name'],
                          style: const TextStyle(
                            color: titleColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          property['location'],
                          style: const TextStyle(
                            color: titleColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset("assets/images/bed.png"),
                            const SizedBox(width: 5),
                            Text(
                              '${property['beds']} Beds',
                              style: const TextStyle(
                                color: titleColor,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset("assets/images/tub.png"),
                            const SizedBox(width: 5),
                            Text(
                              '${property['baths']} Baths',
                              style: const TextStyle(
                                color: titleColor,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset("assets/images/car.png"),
                            const SizedBox(width: 5),
                            Text(
                              '${property['garage']} Garage',
                              style: const TextStyle(
                                color: titleColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
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
                        icon: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: isBookmarked ? titleColor : titleColor,
                        ),
                        onPressed: onBookmarkToggle,
                      ),
                    ),
                  ],
                ),
              ),
              // Owner Details
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(property['ownerpic']),
                      radius: 24,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property['owner'],
                          style: const TextStyle(
                            color: titleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Owner ${property['name']}',
                          style: const TextStyle(
                            color: greyTxtColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: primaryBgColor,
                      ),
                      label: const Text('Call',
                          style: TextStyle(
                            color: primaryBgColor,
                          )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blackBtnColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  property['details'],
                  style: const TextStyle(
                    fontSize: 13,
                    color: customBlackColor,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 12, right: 10, bottom: 0, left: 20),
                child: Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: property['gallery'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            property['gallery'][index],
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding:
                    EdgeInsets.only(top: 12, right: 10, bottom: 0, left: 20),
                child: Text(
                  "Price",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, right: 10, bottom: 0, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${property['price']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blackBtnColor,
                      ),
                      child: const Text('BUY NOW',
                          style: TextStyle(
                            color: primaryBgColor,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

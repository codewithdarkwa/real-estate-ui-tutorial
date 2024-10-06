import 'package:flutter/material.dart';
import 'package:real_estate_ui_tutorial/screens/property_page.dart';

import '../widgets/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: theme.primaryColor,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      //   AppBar
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.primaryColor,
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Current location",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 18,
                              ),
                              Text(
                                "24, Mikel Johnson, US",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.4)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                //   SearchBar

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.white),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.4)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomLeft,
                                stops: [0.4, 1],
                                colors: [
                                  Color(0xff35573b),
                                  Colors.grey,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'GET YOUR 10%\nCASHBACK',
                                        style: theme.textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '*Expires 31 Sept 2024',
                                        style: theme.textTheme.bodySmall?.copyWith(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(
                                "assets/house.png",
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recommended for you',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'By default',
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  const Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ...List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: PropertyCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PropertyPage(image:  "assets/img1.jpg"),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          bottom: 50,
          left: 80,
          right: 80,
          child: HomeBottomNavBar(),
        )
      ],
    );
  }
}

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/img1.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: const Color(0xff48e256), borderRadius: BorderRadius.circular(20)),
                    child: const Text("Active"),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffc6c8f3),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.link_outlined,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffc6c8f3),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.4), borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "\$250,000",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Green Field Island, Western \nByepass",
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      const Icon(Icons.bookmark_outline),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.deepOrangeAccent,
                        size: 18,
                      ),
                      Text(
                        "Off sixway roundabout, byepass (5.1KM)",
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(
                        Icons.king_bed_outlined,
                      ),
                      SizedBox(width: 4),
                      Text("3 bedrooms"),
                      SizedBox(width: 16),
                      Icon(Icons.bathtub),
                      SizedBox(width: 4),
                      Text("2 baths"),
                      SizedBox(width: 16),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

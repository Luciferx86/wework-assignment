import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 22,
                    ),
                    Text(
                      "Redstone Oaks",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Text(
                  "Vishnu Dev agar, Wakad, Pimpri-Chinchawal Road, Pune, Maharashtra 411057, India,",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 70),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                "assets/images/logo.png",
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

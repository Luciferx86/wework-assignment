import 'package:flutter/material.dart';
import 'package:wework/utils/common_utils.dart';
import 'package:wework/widgets/info_card_curly/info_card_curly.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        clipBehavior: Clip.none,
        children: [
          const InfoCardCurly(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We Movies",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "22 Moviesd are loadid in now playing",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 16,
            child: Text(
              CommonUtils.getFormattedDate(
                DateTime.now(),
                pretty: false,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Text(
          //   'Now Playing',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // SizedBox(height: 10),
          // Text(
          //   'Movies',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }
}

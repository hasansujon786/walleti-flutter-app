import 'package:flutter/material.dart';

class AccountCardHeader extends StatelessWidget {
  const AccountCardHeader({super.key, required this.bg});

  final Color bg;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.none,
      background: Stack(
        children: [
          Positioned.fill(child: ColoredBox(color: bg)),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ClipPath(
              clipper: MyArcClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade600, Colors.teal],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       greet(context),
          //       const SizedBox(height: 20),
          //       // const _Card(),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  Widget greet(context) {
    final tt = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good afternoon,',
              style: tt.labelMedium?.copyWith(color: Colors.grey.shade300),
            ),
            const SizedBox(height: 2),
            Text(
              'Hasan Mahmud',
              style: tt.titleLarge?.copyWith(color: Colors.grey.shade300),
            ),
          ],
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          icon: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.teal),
            child: const Icon(Icons.notifications, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class MyArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    // Arc
    final path = Path()
      ..lineTo(0, h - 50)
      ..quadraticBezierTo(w * .5, h, w, h - 50)
      ..lineTo(w, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

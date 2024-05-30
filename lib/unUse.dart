// PageView(
//   controller: _pageController,
//   children: imageUrls
//       .map((imageUrl) => Image.network(
//     imageUrl,
//     fit: BoxFit.cover,
//   ))
//       .toList(),
// ),
///
///
///                   // CarouselSlider(
//                   //   items: imageUrls.map((image) {
//                   //     return Image.asset(image, fit: BoxFit.cover);
//                   //   }).toList(),
//                   //   options: CarouselOptions(
//                   //    // aspectRatio: 16 / 9,
//                   //     autoPlay: false,
//                   //     enlargeCenterPage: true,
//                   //     onPageChanged: (index, reason) {
//                   //       setState(() {
//                   //         currentIndexPage = index;
//                   //       });
//                   //     },
//                   //   ),
//                   // ),
//                   // DotsIndicator(
//                   //   dotsCount: imageUrls.length,
//                   //   position: currentIndexPage.toDouble(),
//                   //   decorator: DotsDecorator(
//                   //     size: const Size.square(9.0),
//                   //     activeSize: const Size(18.0, 9.0),
//                   //     activeShape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(5.0),
//                   //     ),
//                   //   ),
//                   // ),
//                   // Text(
//                   //   'Enjoy Plants',
//                   //   style: TextStyle(
//                   //     fontSize: 20,
//                   //     fontWeight: FontWeight.bold,
//                   //   ),
//                   // ),








// StaggeredGridView.countBuilder(
//   crossAxisCount: 2,
//   itemCount: 6, // Number of grid items
//   itemBuilder: (BuildContext context, int index) => buildGridItem(index),
//   staggeredTileBuilder: (int index) =>
//       StaggeredTile.count(1, index.isEven ? 2 : 1), // Control the height
// ),
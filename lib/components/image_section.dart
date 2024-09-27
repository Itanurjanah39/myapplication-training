import 'package:my_application/main_import.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSizeHelper(context);

    return screenSize.isLandscapeScreen
    ?
    Image.asset(
      image,
      width: screenSize.screenWidth * 0.3,
      height: screenSize.screenHeight,
      fit: BoxFit.contain,
      
    )
    : 
    Image.asset(
      image,
      width: screenSize.screenWidth,
      height: screenSize.screenHeight * 0.2,
      fit: BoxFit.fill,
    );
  }
}
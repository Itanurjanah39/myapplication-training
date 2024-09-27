import 'package:my_application/main_import.dart';

class ScreenSizeHelper{
final BuildContext context;

ScreenSizeHelper(this.context);

double get screenWidth => MediaQuery.of(context).size.width;
double get screenHeight => MediaQuery.of(context).size.height;
bool get isLandscapeScreen => MediaQuery.of(context).orientation == Orientation.landscape;



}
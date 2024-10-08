import 'package:my_application/main_import.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

final String name;
final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name, 
                    style: GoogleFonts.sofadiOne(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                Text(
                    location,
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
            ),
            const Icon(Icons.star, color: Colors.orange,),
            const Text("4", style: TextStyle( fontSize: 22, fontWeight: FontWeight.w400),)
        ],
      ),
      );
  }
}

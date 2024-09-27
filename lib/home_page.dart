import 'package:my_application/main.dart';
import 'package:my_application/main_import.dart';
import  'package:my_application/models.dart';
import 'package:my_application/repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _logout(BuildContext context) async {

 SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Hapus semua data yang disimpan
       if(context.mounted){
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),);
       }
      
 }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white,),
                onPressed: () => _logout(context),
                )
              ],

          title: Row(
            children: [
               IconButton(
                onPressed: (){
                  Navigator.push(
                  context,
                    MaterialPageRoute(
                     builder: (context) => const MyApp()),
                  );
               },
               icon: const Icon(Icons.arrow_back, color: Colors.white,)),
               const Text("Home Page" , 
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ),  
        ),
        body: const MyListPage(),
    );
  }
}

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyListPage> {
  List<Blog> listModel = [];
  Repository repository = Repository();

  getData() async {
    listModel = await repository.getData();
    setState(() {});
  }

  

 

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((context, index) {
        return 
        Container(
          child: 
          Text(
            listModel[index].name
          ),
          
        );
      }), 
      separatorBuilder: (context,index){
        return const Divider();
      }, 
      itemCount: listModel.length);
  }
}
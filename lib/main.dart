import 'package:my_application/main_import.dart';
import 'package:my_application/component_import.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            IconButton(onPressed: (){} , icon: const Icon(Icons.mail, color: Colors.white,)),
            IconButton(onPressed: (){} , icon: const Icon(Icons.map, color: Colors.white,))
          ],
          title: const Text("Login" , 
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        body:  _CheckLogin(),       
      ),
    );
  }
}



class LoginPage extends StatefulWidget {
const LoginPage({super.key});
 @override
 LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {
 final _formKey = GlobalKey<FormState>();
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

 // Fungsi untuk simpan status login di SharedPreferences
 Future<void> _login() async {
 if (_formKey.currentState!.validate()) {
 // Simpan data login di SharedPreferences
 SharedPreferences prefs = await SharedPreferences.getInstance();
 await prefs.setBool('isLoggedIn', true);
 await prefs.setString('email', emailController.text);
 // Arahkan ke halaman utama
 if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
 }
 }
 @override
 Widget build(BuildContext context) {
 return Scaffold(
  appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Login" , 
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,

          ),
          ),
        ),
 body: Padding(
 padding: const EdgeInsets.all(16.0),
 child: Form(
 key: _formKey,
 child: Column(
 children: <Widget>[
 TextFormField(
 controller: emailController,
 decoration: const InputDecoration(labelText: 'Email'),
 validator: (value) {
 if (value == null || value.isEmpty) {
 return 'Email tidak boleh kosong';
 }
 return null;
 },
 ),
 TextFormField(
 controller: passwordController,
 decoration: const InputDecoration(labelText: 'Password'),
 obscureText: true,
 validator: (value) {
 if (value == null || value.isEmpty) {
 return 'Password tidak boleh kosong';
 }
return null;
 },
 ),
 const SizedBox(height: 20),
 ElevatedButton(
 onPressed: _login,
 child: const Text('Login'),
 ),
 ],
 ),
 ),
 ),
 );
 }
}

class _CheckLogin extends StatefulWidget {
 @override
 CheckLoginState createState() => CheckLoginState();
}
class CheckLoginState extends State<_CheckLogin> {
 bool isLoggedIn = false;
 @override
 void initState() {
 super.initState();
 _checkLoginStatus();
 }
 // Fungsi untuk memeriksa status login dari SharedPreferences
 Future<void> _checkLoginStatus() async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
 bool? loggedIn = prefs.getBool('isLoggedIn') ?? false;
 if (loggedIn) {
 // Jika sudah login, arahkan ke HomePage
 if(mounted){
 Navigator.pushReplacement(
 context,
 MaterialPageRoute(builder: (context) => const HomePage()),
 );
 }

 } else {
 // Jika belum login, arahkan ke LoginPage
 if(mounted){
Navigator.pushReplacement(
 context,
 MaterialPageRoute(builder: (context) => const LoginPage()),
 );
 }
 
 }
 }
 @override
 Widget build(BuildContext context) {
 return const Scaffold(
 body: Center(child: CircularProgressIndicator()), // Loading state
 );
 }
}





import 'package:flutter/material.dart';
import 'user_model.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
     ),
     home: const MyHomePage(title:'Infomation '),
   );
    // throw UnimplementedError();
  }

}


class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<User>>(
        future: ApiService.fetchUser(),
        builder: (context,snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));

          }
          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];


              return Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Image.network(user.avatar, width: 50),
                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        user.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        "อายุ ${user.age} | เกิด ${user.birthdate} | เมือง ${user.city}",
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ),

                  ],
                ),
              );


            },

          );
        },
      ),
    );
  }
}

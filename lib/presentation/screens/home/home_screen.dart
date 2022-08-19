import 'package:flutter/material.dart';
import 'package:projects/models/post.dart';
import 'package:projects/services/services.dart';

class HomeScreen extends StatefulWidget {

  final  email ;
  final  username ;

  const HomeScreen({Key? key, this.email, this.username,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getData();
  }

  List<Post>? posts;

  var isLoaded = false;

  getData() async {
    posts = await APiService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const Drawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: const Text("Lorem Ipsum"),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(
                text: 'All Post',
              ),
              Tab(
                text: 'Profile',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
            children: [
          Visibility(
            visible: isLoaded,
            child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text("Title"),
                  subtitle: Text(
                    posts![index].body ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },

            ),
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
          ),


              Column(
                children: const [
                   ListTile(
                    title:  Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    trailing:  Text("Leanne Graham",style: TextStyle(fontSize: 20),),
                  ),
                  Divider(),
                   ListTile(
                    title:  Text("Username",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    trailing:  Text("Bret",style: TextStyle(fontSize: 20),),
                  ),
                  Divider(),
                  ListTile(
                    title:  Text("Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    trailing:  Text("demo ",style: TextStyle(fontSize: 20),),
                  ),
                  Divider(),
                  ListTile(
                    title:  Text("Zipcode ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    trailing:  Text("99744-746548",style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
        ]));
  }
}

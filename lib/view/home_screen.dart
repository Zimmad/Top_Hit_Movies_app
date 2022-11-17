import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../model/data/responce/status.dart';
import '../utils/utils.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    _homeViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home Screen')),
        body: ChangeNotifierProvider(
          create: (context) {
            return _homeViewModel;
          },
          child: Consumer<HomeViewModel>(builder: ((context, value, child) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.movieList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.movieList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                          value.movieList.data!.movies![index].posterurl!
                              .toString(),
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error),
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          value.movieList.data!.movies![index].title.toString(),
                        ),
                        subtitle: Text(value.movieList.data!.movies![index].year
                            .toString()),
                        trailing: Row(children: [
                          Text(Utils.averageRatings(
                                  value.movieList.data!.movies![index].ratings!)
                              .toString()),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        ]),
                      );
                    });
              default:
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );
            }
          })),
        ));
  }
}

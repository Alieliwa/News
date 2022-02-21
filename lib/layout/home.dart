import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../modules/search/search.dart';
import '../shared/components/components.dart';
import '../shared/cubit/app_cubit.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsAppCubit cubit = NewsAppCubit.get(context);
          AppCubit appCubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text("News")),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, Search());
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      appCubit.changeMode();
                    },
                    icon: !appCubit.isDark
                        ? Icon(Icons.brightness_4_outlined)
                        : Icon(Icons.wb_sunny_rounded)),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: cubit.items,
            ),
          );
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/navigation/nav_bar_items.dart';
import '../../../cubit/navigation/navigation_cubit.dart';

Widget appBar(context) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            BlocProvider.of<NavigationCubit>(context)
                .getNavBarItem(NavbarItem.home);
          },
        ),
        IconButton(
          icon: const Icon(Icons.search, size: 30),
          onPressed: () {},
        )
      ],
    ),
  );
}

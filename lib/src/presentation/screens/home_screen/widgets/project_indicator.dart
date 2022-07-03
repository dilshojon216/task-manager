import 'package:flutter/material.dart';

Widget projectIndicator(state, context, _pageIndex) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        state.projectTasks.length,
        (index) => buildDot(index, context, _pageIndex),
      ),
    ),
  );
}

Container buildDot(int index, BuildContext context, _pageIndex) {
  return Container(
    height: 10,
    width: _pageIndex == index ? 30 : 10,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      gradient: _pageIndex == index
          ? LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColorDark
              ],
            )
          : null,
      borderRadius: BorderRadius.circular(20),
      color: _pageIndex == index
          ? const Color.fromRGBO(255, 137, 130, 1)
          : const Color(0xffD8DEF3),
    ),
  );
}

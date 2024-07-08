import 'package:flutter/material.dart';
import 'package:flutterstore/widgets/paginations/actions/act_multiple.dart';
import 'package:flutterstore/widgets/paginations/actions/act_single.dart';
import 'package:flutterstore/widgets/paginations/pagination_item.dart';

// ignore: must_be_immutable
class Paginations extends StatelessWidget {
  dynamic current;
  List<dynamic> pages;
  Function() onLatest, onPrev, onNext, onEnd;
  Function(int) onChangePage; 
  Paginations({
    super.key,
    required this.onLatest,
    required this.onPrev,
    required this.onNext,
    required this.onEnd,
    required this.onChangePage,
    required this.pages,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    bool noPages() {
      return pages.length == 0;
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActMultiple(
            action: "latest",
            onPress: noPages() ? (){} : onLatest
          ),
          SizedBox(width: 8,),
          ActSingle(
            action: "prev", 
            onPress: noPages() ? (){} :  onPrev
          ),
          SizedBox(
            width: 8,
          ),
          Row(
            children: pages.map((page) {
              return Container(
                margin: EdgeInsets.only(
                  right: 8
                ),
                child: PaginationItem(
                  page: page,
                  current: current,
                  onPress: () {
                    if (page != "...") {
                      onChangePage(page);
                    }
                  }
                ),
              );
            }).toList(),
          ),
          ActSingle(
            action: "next", 
            onPress: noPages() ? (){} :  onNext
          ),
          SizedBox(
            width: 8,
          ),
          ActMultiple(
            action: "end",
            onPress: noPages() ? (){} :  onEnd
          ),
        ],
      ),
    );
  }
}
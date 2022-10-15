import 'package:flutter/material.dart';

class StockListList extends StatelessWidget {
  const StockListList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
    /*
    return Observer(
      builder: (_) {
        switch (Future.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );

          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Falha ao carregar dados.',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('Tente Novamente'),
                    onPressed: _refresh,
                  )
                ],
              ),
            );

          case FutureStatus.fulfilled:
            final List<GroupHasAttributeModel> posts = future.result;
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return PizDoughItem(item: post);
                },
              ),
            );
            break;
        }
        return widtget;
      },
    );
    */
  }

  //Future _refresh() => store.fetchPosts();
}

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

final _bg = Colors.grey.shade100;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void onTnxViewToggle(bool b) {}

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const _DbAppBar(),
        DbTtransactionListHeader(
          bg: _bg,
          isTransactionsView: true,
          toggleTransactioView: onTnxViewToggle,
        ),
        const DbTransactionListView(),
        const SliverPadding(padding: EdgeInsets.only(bottom: 40))
      ],
    );
  }
}

class _DbAppBar extends StatelessWidget {
  const _DbAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 12,
      centerTitle: true,
      leadingWidth: 46,
      // title: const Text('sdf', style: TextStyle(fontSize: 16)),
      expandedHeight: 300,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.teal,
      flexibleSpace: AccountCardHeader(bg: _bg),
    );
  }
}

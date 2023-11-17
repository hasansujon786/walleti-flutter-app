import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

// #F4F6F6
final _bg = Colors.grey.shade100;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void onTnxViewToggle(bool b) {}

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          titleSpacing: 12,
          centerTitle: true,
          leadingWidth: 46,
          // title: const Text('sdf', style: TextStyle(fontSize: 16)),
          expandedHeight: 300,
          pinned: true,
          stretch: true,
          backgroundColor: Colors.teal,
          flexibleSpace: AccountCardHeader(mutedBg: _bg),
        ),
        DbTtransactionListHeader(
          bg: _bg,
          isTransactionsView: true,
          toggleTransactioView: onTnxViewToggle,
        ),
        const DbTransactionListView(),
        const SliverToBoxAdapter(child: ColoredBox(color: Colors.white, child: SizedBox(height: 60)))
      ],
    );
  }
}

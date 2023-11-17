import 'package:flutter/material.dart';

final _alignments = [Alignment.centerLeft, Alignment.centerRight];

class OptionSwitchBar extends StatefulWidget {
  final List<String> optionsNames;
  final int initialIndex;

  const OptionSwitchBar({
    super.key,
    required this.optionsNames,
    this.initialIndex = 0,
  });

  @override
  State<OptionSwitchBar> createState() => _OptionSwitchBarState();
}

class _OptionSwitchBarState extends State<OptionSwitchBar> {
  late int _initialIndex = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 280),
              alignment: _alignments[_initialIndex],
              curve: Curves.fastOutSlowIn,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(''),
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (var i = 0; i < widget.optionsNames.length; i++)
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() => _initialIndex = i);
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(Colors.grey.shade400.withOpacity(0.3)),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Text(widget.optionsNames[i], style: Theme.of(context).textTheme.labelLarge),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

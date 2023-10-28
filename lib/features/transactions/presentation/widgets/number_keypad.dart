import 'package:flutter/material.dart';

const numkeyValues = {
  '1': '1',
  '2': '2',
  '3': '3',
  '4': '4',
  '5': '5',
  '6': '6',
  '7': '7',
  '8': '8',
  '9': '9',
  '0': '0',
  '.': '.',
};
const oparatorKeyValues = {
  '/': '/',
  '*': '*',
  '-': '-',
  '<': '<',
  '+': '+',
};

class NumKeyUtils {
  static bool isNumberValue(String input) {
    return oparatorKeyValues[input] == null;
  }

  static bool isOparentValue(String input) {
    return oparatorKeyValues[input] != null;
  }
}

class FormNumberKeypad extends StatefulWidget {
  const FormNumberKeypad({super.key});

  @override
  State<FormNumberKeypad> createState() => _FormNumberKeypadState();
}

class _FormNumberKeypadState extends State<FormNumberKeypad> {
  String display = '';
  String curDigits = '';
  double lastResult = 0;
  String? lastOparatory;
  List<String> inputs = [];

  void _handleKeyPress(String curInput) async {
    await _handleKeyInput(curInput);
    printResult();
    setState(() {});
  }

  double _calculate(String newDigits, String oparator) {
    lastResult = lastResult + double.parse(newDigits);
    return lastResult;
  }

  String _calculateDisplay(String newDigits, String? oparator) {
    display = (lastResult + double.parse(newDigits)).toString();
    return display;
  }

  void _updateLastInput(String newDigits) {
    inputs[inputs.length - 1] = newDigits;
  }


  Future<void> _handleKeyInput(String curInput) async {
    final isCurInputOparator = NumKeyUtils.isOparentValue(curInput);
    if (isCurInputOparator) {
      lastOparatory = curInput;
      final res = _calculate(curDigits, curInput);
      display = res.toString();
      inputs.add(curInput); // push oparator to inputs
      curDigits = '';
      return;
    }

    final isCurInputNumber = NumKeyUtils.isNumberValue(curInput);
    // init with first key
    if (isCurInputNumber && inputs.isEmpty) {
      curDigits = curInput;
      display = curInput;
      inputs.add(curInput);
      return;
    } else if (isCurInputNumber && inputs.isNotEmpty) {
      final isPrevInputNumber = NumKeyUtils.isNumberValue(inputs.last);
      // if current input & previous input both are numbere than combine both
      // with in same index
      if (isPrevInputNumber) {
        curDigits = curDigits + curInput;
        display = curDigits;
        _updateLastInput(curDigits);
        if (lastOparatory != null) {
          _calculateDisplay(curDigits, lastOparatory);
        }

        return;
      }

      // if current input is number & previous input is Oparator
      final isPrevInputOpatator = NumKeyUtils.isOparentValue(inputs.last);
      if (isPrevInputOpatator) {
        curDigits = curInput;
        if (lastOparatory != null) {
          _calculateDisplay(curDigits, lastOparatory);
        }
        inputs.add(curInput);
        return;
      }
    }

    return;
  }

  void printResult() {
    print('==============================');
    print('curDigits: $curDigits');
    print('inputs   : $inputs');
    print('display  : $display');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(children: [
            Text(inputs.join(' ')),
            const Text(' = '),
            Text(display),
          ]),
          GridView.count(
            shrinkWrap: true,
            childAspectRatio: 3 / 2,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: 4,
            children: [
              // row 1
              NumKey(const _KeyText('1'), keyValue: '1', onTap: _handleKeyPress),
              NumKey(const _KeyText('2'), keyValue: '2', onTap: _handleKeyPress),
              NumKey(const _KeyText('3'), keyValue: '3', onTap: _handleKeyPress),
              NumKey(const _KeyText('/'), keyValue: '/', onTap: _handleKeyPress),
              // row 2
              NumKey(const _KeyText('4'), keyValue: '4', onTap: _handleKeyPress),
              NumKey(const _KeyText('5'), keyValue: '5', onTap: _handleKeyPress),
              NumKey(const _KeyText('6'), keyValue: '6', onTap: _handleKeyPress),
              NumKey(const _KeyText('*'), keyValue: '*', onTap: _handleKeyPress),
              // row 3
              NumKey(const _KeyText('7'), keyValue: '7', onTap: _handleKeyPress),
              NumKey(const _KeyText('8'), keyValue: '8', onTap: _handleKeyPress),
              NumKey(const _KeyText('9'), keyValue: '9', onTap: _handleKeyPress),
              NumKey(const _KeyText('-'), keyValue: '-', onTap: _handleKeyPress),
              // row 4
              NumKey(const _KeyText('.'), keyValue: '.', onTap: _handleKeyPress),
              NumKey(const _KeyText('0'), keyValue: '0', onTap: _handleKeyPress),
              NumKey(const _KeyText('<'), keyValue: '<', onTap: _handleKeyPress),
              NumKey(const _KeyText('+'), keyValue: '+', onTap: _handleKeyPress),
            ],
          ),
        ],
      ),
    );
  }
}

class NumKey extends StatelessWidget {
  const NumKey(
    this.keyText, {
    super.key,
    required this.keyValue,
    required this.onTap,
  });
  final Widget keyText;
  final String keyValue;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          onTap(keyValue);
        },
        child: Ink(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(width: 1, color: Colors.grey.shade200),
            // borderRadius: BorderRadius.circular(_size),
          ),
          child: Center(child: keyText),
        ),
      ),
    );
  }
}

class _KeyText extends StatelessWidget {
  const _KeyText(this.keyText);
  final String keyText;

  @override
  Widget build(BuildContext context) {
    return Text(keyText, style: Theme.of(context).textTheme.titleLarge);
  }
}

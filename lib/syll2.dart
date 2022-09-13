import 'package:flutter/material.dart';
import 'package:untitled/pairs.dart';

class SyllableText2 extends StatefulWidget {
  const SyllableText2({
    required this.text,
    required this.parts,
    Key? key,
  }) : super(key: key);

  final String text;
  final List<Trio> parts;

  @override
  SyllableText2State createState() => SyllableText2State();
}

class SyllableText2State extends State<SyllableText2> {
  int currentPartIndex = 0;
  List<TextSpan> spans = [];

  @override
  void initState() {
    super.initState();
    cutting();
  }

  void cutting() {
    int i = 0;
    spans.add(
      TextSpan(
        style: TextStyle(
          color: Colors.black,
        ),
        text: widget.text.substring(0, widget.parts[0].a),
      ),
    );
    for (i; i < widget.parts.length; i++) {
      spans.add(
        TextSpan(
          style: TextStyle(
            color: widget.parts[i].c == 'hamzat_wasl'
                ? Colors.black
                : widget.parts[i].c == 'lam_shamsiyyah' ||
                widget.parts[i].c == 'silent'
            // ||widget.parts[i].c == 'idghaam_no_ghunnah'
                ? Colors.grey
                : widget.parts[i].c == 'madd_2'
                ? Colors.yellow
                : widget.parts[i].c == 'madd_246'
                ? Colors.deepOrange
                : widget.parts[i].c == 'madd_6' ||
                widget.parts[i].c == 'madd_muttasil' ||
                widget.parts[i].c == 'madd_munfasil'
                ? Colors.pink
                : widget.parts[i].c == 'ghunnah' ||
                widget.parts[i].c == 'ikhfa_shafawi' ||
                widget.parts[i].c == 'ikhfa'
                ? Colors.green
                : widget.parts[i].c == 'qalqalah'
                ? Colors.blue
                : widget.parts[i].c == 'iqlab'
                ? Colors.cyanAccent
                : Colors.black,
          ),
          text: widget.text.substring(widget.parts[i].a, widget.parts[i].b + 1),
        ),
      );
      if (i < widget.parts.length - 1) {
        if (widget.parts[i].b + 1 != widget.parts[i + 1].a) {
          spans.add(
            TextSpan(
              style: TextStyle(
                color: Colors.black,
              ),
              text: widget.text
                  .substring(widget.parts[i].b + 1, widget.parts[i + 1].a),
            ),
          );
        }
      }
    }
    spans.add(
      TextSpan(
        style: TextStyle(
          color: Colors.black,
        ),
        text: widget.text.substring(widget.parts[i - 1].b + 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (currentPartIndex < widget.parts.length) {
    //   final part = widget.parts[currentPartIndex];
    //   final startText = widget.text.substring(0, part.a);
    //   final coloredText = widget.text.substring(part.a, part.b + 1);
    //   final endText = widget.text.substring(part.b + 1);
    //   return Text.rich(
    //     TextSpan(
    //       children: [
    //         TextSpan(
    //           text: startText,
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 30,
    //           ),
    //         ),
    //         TextSpan(
    //           text: coloredText,
    //           style: TextStyle(
    //             color: Colors.blue,
    //             fontWeight: FontWeight.bold,
    //             fontSize: 30,
    //           ),
    //         ),
    //         TextSpan(
    //           text: endText,
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 30,
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // } else {
    // currentPartIndex = 0;
    return SingleChildScrollView(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          children: spans,
        ),
      ),
    );
  }
}
// }

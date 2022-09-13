import 'package:flutter/material.dart';
import 'package:untitled/pairs.dart';

class SyllableText extends StatefulWidget {
  const SyllableText({
    required this.text,
    required this.parts,
    Key? key,
  }) : super(key: key);

  final String text;
  final List<Trio> parts;

  @override
  SyllableTextState createState() => SyllableTextState();
}

class SyllableTextState extends State<SyllableText> {
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
            color: widget.parts[i].c == 'lam_shamsiyyah' ||
                    widget.parts[i].c == 'silent' ||
                    widget.parts[i].c == 'hamzat_wasl'
                ? Colors.grey
                : widget.parts[i].c == 'madd_2'
                    ? Color(0xff537FFF)
                    : widget.parts[i].c == 'madd_246'
                        ? Color(0xff4050FF)
                        : widget.parts[i].c == 'madd_6'
                            ? Color(0xff000EBC)
                            : widget.parts[i].c == 'ikhfa'
                                ? Color(0xff9400A8)
                                : widget.parts[i].c == 'qalqalah'
                                    ? Color(0xFFDD0008)
                                    : widget.parts[i].c == 'iqlab'
                                        ? Color(0xFF26BFFD)
                                        : widget.parts[i].c ==
                                                    'madd_muttasil' ||
                                                widget.parts[i].c ==
                                                    'madd_munfasil'
                                            ? Color(0xff2144C1)
                                            : widget.parts[i].c == 'ghunnah'
                                                ? Color(0xFFFF7E1E)
                                                : widget.parts[i].c ==
                                                        'ikhfa_shafawi'
                                                    ? Color(0xffD500B7)
                                                    : widget.parts[i].c ==
                                                            'idghaam_ghunnah'
                                                        ? Color(0xff169777)
                                                        : widget.parts[i].c ==
                                                                'idghaam_no_ghunnah'
                                                            ? Color(0xff169200)
                                                            : widget.parts[i]
                                                                        .c ==
                                                                    'idghaam_shafawi'
                                                                ? Color(
                                                                    0xff169200)
                                                                : widget.parts[i].c ==
                                                                            'idghaam_mutajaanisain' ||
                                                                        widget.parts[i].c ==
                                                                            'idghaam_mutaqaaribain'
                                                                    ? Color(
                                                                        0xffA1A1A1)
                                                                    : Colors
                                                                        .black,
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

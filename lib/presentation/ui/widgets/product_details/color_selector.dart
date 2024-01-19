import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector(
      {super.key, required this.colors, required this.onChange});

  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  @override
  late Color _selectedColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColor = widget.colors.first;
  }

  Widget build(BuildContext context) {
    return Row(
      children: widget.colors
          .map((c) => InkWell(
                onTap: () {
                  _selectedColor = c;
                  widget.onChange(c);
                  if (mounted) {
                    setState(() {});
                  }
                },
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: c,
                    child: _selectedColor == c
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

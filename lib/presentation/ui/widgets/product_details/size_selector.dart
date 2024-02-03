import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.size, required this.onChange});

  final List<String> size;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  @override
  late String _selectedSize;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedSize = widget.size.first;
    widget.onChange(_selectedSize);
  }

  Widget build(BuildContext context) {
    return Row(
      children: widget.size
          .map((c) => InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  _selectedSize = c;
                  widget.onChange(c);
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                    color: c == _selectedSize ? AppColors.primaryColor : null,
                  ),
                  child: Text(
                    c,
                    style: TextStyle(
                        color:
                            c == _selectedSize ? Colors.white : Colors.black45),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

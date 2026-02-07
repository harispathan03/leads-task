import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDropdown<T> extends StatelessWidget {
  final String? title;
  final List<T> items;
  final T value;
  final void Function(T?)? onChanged;
  final TextEditingController? searchController;
  final String Function(T) itemLabelBuilder; 
  final Widget? Function(T)? itemWidgetBuilder; 

  const CommonDropdown({
    super.key,
    this.title,
    required this.items,
    required this.value,
    this.onChanged,
    this.searchController,
    required this.itemLabelBuilder, this.itemWidgetBuilder, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(title!, style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: true,
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down),
              ),
              value: value,
              onChanged: onChanged,
              hint: Text(
                'Select $title',
                style: TextStyle(fontSize: 16),),
              dropdownSearchData: searchController != null
                  ? DropdownSearchData(
                      searchController: searchController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            hintText: 'Search $title...',
                            hintStyle: const TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return itemLabelBuilder(item.value as T)
                            .toLowerCase()
                            .contains(searchValue.toLowerCase());
                      },
                    )
                  : null,
              dropdownStyleData: DropdownStyleData(
                maxHeight: searchController==null ? 200 : 260,
                width: Get.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
              style: TextStyle(fontSize: 16, color: Colors.black),
              items: items.map((type) {
                return DropdownMenuItem<T>(
                  value: type,
                  child: itemWidgetBuilder!=null ? itemWidgetBuilder!(type)! : Text(itemLabelBuilder(type)), // 👈 use label builder
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

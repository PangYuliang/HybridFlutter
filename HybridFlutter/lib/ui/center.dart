import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hybrid_flutter/entity/component.dart';
import 'package:hybrid_flutter/entity/data.dart';
import 'package:hybrid_flutter/ui/base_widget.dart';

import 'basic.dart';

class CenterStateless extends BaseWidget {
  CenterStateless(BaseWidget parent, String pageId, MethodChannel methodChannel,
      Component component)
      : super(
            parent: parent,
            pageId: pageId,
            methodChannel: methodChannel,
            component: component,
            data: ValueNotifier(Data(component.properties)));
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        builder: (BuildContext context, Data data, Widget child) {
          return Center(
              key: ObjectKey(component),
              widthFactor: MDouble.parse(data.map['width-factor']),
              heightFactor: MDouble.parse(data.map['height-factor']),
              child: data.children.isNotEmpty ? data.children[0] : null);
        },
        valueListenable: this.data);
  }
}

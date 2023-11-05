import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:server_driven_ui_casa/src/data/source/remote/model/remote_server_u_i.dart';
import 'package:server_driven_ui_casa/src/domian/entities/server_entity.dart';
import 'package:server_driven_ui_casa/src/domian/repo/repo.dart';

class ServerDrivenUIRepoImpl extends ServerDrivenUIRepository {
  @override
  Future<ServerUI> getUi() async {
    dynamic obj;
    // ServerDrivenResponse.fromJson(
    //     await parseJsonFromAssets('assets/json/container.json'), (val) {
    //   return RemoteServerUI.fromJson(val['child']).toDomain();
    //   //print(val);
    // });
    // print(obj['child']);
    // Map<String, dynamic> json = obj.toJson((value) => null);
    final json = {
      "type": "dy_column",
      "data": {
        "key": "2457231",
        "mainAxisAlignment": "spaceBetween",
        "crossAxisAlignment": "start",
        "children": [
          {
            "type": "dy_text",
            "date": {
              "key": "2232734233",
              "text": "Container",
              "style": {
                "color": "0xffff0000",
                "fontSize": 20,
                "fontWeight": "bold"
              }
            }
          },
          {
            "type": "dy_text",
            "date": {
              "key": "223667757234",
              "text": "a widget that holds other widgets"
            }
          }
        ]
      }
    };
    return RemoteServerUI.fromJson(json).toDomain();
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}

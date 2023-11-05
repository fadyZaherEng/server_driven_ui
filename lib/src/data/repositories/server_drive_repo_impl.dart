import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:server_driven_ui_casa/src/data/source/remote/model/remote_server_u_i.dart';
import 'package:server_driven_ui_casa/src/domian/entities/server_entity.dart';
import 'package:server_driven_ui_casa/src/domian/repo/repo.dart';

class ServerDrivenUIRepoImpl extends ServerDrivenUIRepository {
  @override
  Future<ServerUI> getUi() async {
    // ServerDrivenResponse.fromJson(
    //     await parseJsonFromAssets('assets/json/container.json'), (val) {
    //   return RemoteServerUI.fromJson(val['child']).toDomain();
    //   //print(val);
    // });
    // print(obj['child']);
    // Map<String, dynamic> json = obj.toJson((value) => null);
    // ServerDrivenResponse<RemoteServerUI> response =
    //     ServerDrivenResponse.fromJson({
    //   "key": "345345",
    //   "padding": 10.0,
    //   "child": {
    //     "type": "dy_column",
    //     "data": {
    //       "key": "2457231",
    //       "mainAxisAlignment": "spaceBetween",
    //       "crossAxisAlignment": "start",
    //       "children": [
    //         {
    //           "type": "dy_text",
    //           "date": {
    //             "key": "2232734233",
    //             "text": "Container",
    //             "style": {
    //               "color": "0xffff0000",
    //               "fontSize": 20,
    //               "fontWeight": "bold"
    //             }
    //           }
    //         },
    //         {
    //           "type": "dy_text",
    //           "date": {
    //             "key": "223667757234",
    //             "text": "a widget that holds other widgets"
    //           }
    //         }
    //       ]
    //     }
    //   }
    // }, (json) {
    //   return ServerDrivenResponse. ;
    // });
    //
    //return response.child!.toDomain();
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
              "text": "Question",
              "style": {
                "color": "0xffff0000",
                "fontSize": 20,
                "fontWeight": "bold"
              }
            }
          },
          {
            "type": "dy_text_field",
            "date": {
              "key": "2232734233",
              "text": "Answer",
              "style": {
                "color": "0xf93f0869",
                "fontSize": 20,
                "fontWeight": "bold"
              }
            }
          },
          {
            "type": "dy_date",
            "date": {"key": "223667757234", "text": "5-11-2023"}
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

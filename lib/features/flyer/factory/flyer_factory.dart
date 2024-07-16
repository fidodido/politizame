import 'package:flutter/material.dart';
import '../bloc/flyer_state.dart';
import '../widgets/circle/circular_1.dart';
import '../widgets/face/face_1.dart';
import '../widgets/face/face_2.dart';
import '../widgets/face/face_3.dart';

enum FlyerType { face, flag, circular }

enum CircularType { circular_1 }

enum FaceType { face_1, face_2, face_3 }

class FlyerFactory {
  static Widget create(FlyerState state, String type) {
    if (type == CircularType.circular_1.name) return Circular1(state: state);
    if (type == FaceType.face_1.name) return Face1(state: state);
    if (type == FaceType.face_2.name) return Face2(state: state);
    if (type == FaceType.face_3.name) return Face3(state: state);

    throw 'Error, type $type does not exists';
  }

  static int styleLength(FlyerType type) {
    if (type == FlyerType.circular) return CircularType.values.length;
    if (type == FlyerType.face) return FaceType.values.length;
    throw 'Error, type $type does not exists';
  }

  static int next(FlyerState state, FlyerType type, index) {
    if (type == FlyerType.face) {
      return FaceType.values.length - 1 == index ? 0 : index + 1;
    }

    if (type == FlyerType.circular) {
      return CircularType.values.length - 1 == index ? 0 : index + 1;
    }

    throw 'Error, type $type doest exist';
  }

  static String findByIndex(FlyerState state, FlyerType type, index) {
    if (type == FlyerType.face) {
      return FaceType.values[index].name;
    }

    if (type == FlyerType.circular) {
      return CircularType.values[index].name;
    }

    throw 'Error, type $type doest exist';
  }
}

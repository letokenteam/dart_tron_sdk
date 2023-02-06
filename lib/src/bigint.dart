import 'dart:typed_data';
// ignore: implementation_imports
import 'package:pointycastle/src/utils.dart' as utils;

Uint8List bigIntToUint8List(BigInt bigInt) =>
    bigIntToByteData(bigInt).buffer.asUint8List();

BigInt decodeBigIntWithSign(List<int> input) {
  return utils.decodeBigIntWithSign(1, input);
}

ByteData bigIntToByteData(BigInt bigInt) {
  final data = ByteData((bigInt.bitLength / 8).ceil());
  var bi = bigInt;

  for (var i = 1; i <= data.lengthInBytes; i++) {
    data.setUint8(data.lengthInBytes - i, bi.toUnsigned(8).toInt());
    bi = bi >> 8;
  }

  return data;
}

import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

class Aes {
  final int keySize;
  final int blockSize;
  final Uint8List _key;
  final Uint8List _iv;

  Aes(String key, {this.keySize = 128, this.blockSize = 128})
      : _key = Uint8List.fromList(utf8.encode(key)),
        _iv = Uint8List(blockSize ~/ 8);

  Uint8List encrypt(Uint8List plaintext) {
    final paddedPlaintext = _pad(plaintext);
    final cipher = _getCipher(true);
    cipher.init(true, _createParameters());
    final ciphertext = cipher.process(paddedPlaintext);
    return ciphertext;
  }

  Uint8List decrypt(Uint8List ciphertext) {
    final cipher = _getCipher(false);
    cipher.init(false, _createParameters());
    final paddedPlaintext = cipher.process(ciphertext);
    final plaintext = _unpad(paddedPlaintext);
    return plaintext;
  }

  PaddedBlockCipherImpl _getCipher(bool forEncryption) {
    final cipher = PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESFastEngine()))
      ..init(forEncryption, _createParameters());
    return cipher;
  }

  PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null> _createParameters() {
    final keyParameter = KeyParameter(_key);
    final params = PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(
        ParametersWithIV(keyParameter, _iv), null);
    return params;
  }

  Uint8List _pad(Uint8List data) {
    final blockSizeInBytes = blockSize ~/ 8;
    final paddingLength = blockSizeInBytes - (data.length % blockSizeInBytes);
    final padding = Uint8List(paddingLength)..fillRange(0, paddingLength, paddingLength);
    final paddedData = Uint8List.fromList([...data, ...padding]);
    return paddedData;
  }

  Uint8List _unpad(Uint8List data) {
    final paddingLength = data.last;
    final unpaddedData = data.sublist(0, data.length - paddingLength);
    return unpaddedData;
  }
}
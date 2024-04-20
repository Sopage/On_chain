import 'package:on_chain/tron/src/models/contract/base_contract/base.dart';
import 'package:on_chain/tron/src/protbuf/decoder.dart';

class SmartContractBABIEntryParam extends TronProtocolBufferImpl {
  /// Create a new [SmartContractBABIEntryParam] instance with specified parameters.
  SmartContractBABIEntryParam({this.indexed, this.name, required this.type});

  /// Create a new [SmartContractBABIEntryParam] instance by parsing a JSON map.
  factory SmartContractBABIEntryParam.fromJson(Map<String, dynamic> json) {
    return SmartContractBABIEntryParam(
        type: json["type"], name: json["name"], indexed: json["indexed"]);
  }
  factory SmartContractBABIEntryParam.deserialize(List<int> bytes) {
    final decode = TronProtocolBufferImpl.decode(bytes);
    return SmartContractBABIEntryParam(
        type: decode.getField(3),
        name: decode.getField(2),
        indexed: decode.getField(1));
  }
  final bool? indexed;
  final String? name;
  final String type;

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  List get values => [indexed, name, type];

  /// Convert the [SmartContractBABIEntryParam] object to a JSON representation.
  @override
  Map<String, dynamic> toJson() {
    return {"type": type, "indexed": indexed, "name": name}
      ..removeWhere((key, value) => value == null);
  }

  /// Convert the [SmartContractBABIEntryParam] object to its string representation.
  @override
  String toString() {
    return 'SmartContractBABIEntryParam{${toJson()}}';
  }
}

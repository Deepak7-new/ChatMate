///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const SendJoin$json = const {
  '1': 'SendJoin',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

const GetJoin$json = const {
  '1': 'GetJoin',
};

const SendMessage$json = const {
  '1': 'SendMessage',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'smsg', '3': 3, '4': 1, '5': 9, '10': 'smsg'},
  ],
};

const GetMessage$json = const {
  '1': 'GetMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'from', '3': 2, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 3, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'rmsg', '3': 4, '4': 1, '5': 9, '10': 'rmsg'},
    const {'1': 'time', '3': 5, '4': 1, '5': 9, '10': 'time'},
  ],
};

const SendAllMessage$json = const {
  '1': 'SendAllMessage',
  '2': const [
    const {'1': 'usr', '3': 1, '4': 1, '5': 9, '10': 'usr'},
  ],
};

const GetAllMessage$json = const {
  '1': 'GetAllMessage',
  '2': const [
    const {'1': 'msgs', '3': 1, '4': 3, '5': 11, '6': '.chat.GetMessage', '10': 'msgs'},
  ],
};

const SendUsers$json = const {
  '1': 'SendUsers',
};

const GetUsers$json = const {
  '1': 'GetUsers',
  '2': const [
    const {'1': 'names', '3': 1, '4': 3, '5': 9, '10': 'names'},
  ],
};


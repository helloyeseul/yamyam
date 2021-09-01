import 'package:test/test.dart';
import 'package:yamstack/extensions/string_helper.dart';

void main() {
  test('이메일 테스트', () {
    expect('abc@gmail.com'.isNotEmail, false);
    expect('abc@gmail'.isNotEmail, true);
    expect('abc@'.isNotEmail, true);
    expect('abc'.isNotEmail, true);
  });

  test('닉네임 테스트', () {
    expect('_안녕!!'.isNickname, false, reason: '특수문자');
    expect('abc.sdhks'.isNickname, false, reason: '특수문자');

    expect('hello'.isNickname, true, reason: '영어');
    expect('안녕'.isNickname, true, reason: '한글');
    expect('hi안녕하세요'.isNickname, true, reason: '영어+한글');
    expect('hi안녕123'.isNickname, true, reason: '영어+한글+숫자');

    expect(''.isNickname, false, reason: '최소 길이보다 작음');
    expect('12345abcdeㅇㅇ'.isNickname, false, reason: '최대 길이 넘김');

    expect('1'.isNickname, true, reason: '최소 길이');
    expect('12345abcde'.isNickname, true, reason: '최대 길이');
  });
}

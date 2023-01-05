import "package:test/test.dart";

/// Test for error handling
main() {
  group("Error Handling Tests", () {
    test("substring can't be too big: RangeError", () {
      expect(() => "abc".substring(5, 5), throwsRangeError);
    });
    test("substring can't be negative: RangeError", () {
      expect(() => "abc".substring(-1), throwsRangeError);
    });
    test("Deliberately throwing a 'MyError'", () {
      expect(() => dummyProcess("1"), throwsA(TypeMatcher<MyError>()));
    });
  });
}

dummyProcess(String x) {
  if (x.length == 0) {
    throw AssertionError("I don't like your input");
  }
  if (x.length == 1) {
    throw MyError();
  }
  if (x == 'date') {
    throw DateTime.now();
  }
  if (x == 'number') {
    throw 1;
  }
  print("OK");
}
class MyError {

}
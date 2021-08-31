String assertNotEmpty(String? value, String? message) {
  assert(value?.isNotEmpty == true, message);
  return value!;
}

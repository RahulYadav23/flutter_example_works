mixin Validators {
  String? emailValid(String? value) {
    if (value == null || value.isEmpty) {
      return "You can't leave it empty";
    }
    if (!value.contains("@")) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? passwordValid(String? value) {
    if (value == null || value.isEmpty) {
      return "You can't leave it empty";
    }
    if (value.length < 4) {
      return "Please enter a minimum of 4 characters";
    }
    return null;
  }
}

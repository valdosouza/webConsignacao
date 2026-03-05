/// Simple form validators used by auth and other forms.
/// Kept in a separate file for testability without touching UI.
library;

/// Returns an error message if [email] is invalid; null if valid.
String? validateEmail(String? email) {
  if (email == null || email.isEmpty) return 'E-mail é obrigatório';
  final regex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (!regex.hasMatch(email)) return 'E-mail inválido';
  return null;
}

/// Returns an error message if [value] is empty; null if valid.
String? validateRequired(String? value, [String fieldName = 'Campo']) {
  if (value == null || value.trim().isEmpty) return '$fieldName é obrigatório';
  return null;
}

/// Returns an error message if [password] is too short; null if valid.
String? validatePassword(String? password, {int minLength = 1}) {
  if (password == null) return 'Senha é obrigatória';
  if (password.length < minLength) return 'Senha deve ter no mínimo $minLength caracteres';
  return null;
}

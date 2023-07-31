class SquareMeter {
  double length = 0.0;
  double size = 0.0;
  double square = 0.0;

  SquareMeter(this.length, this.size);

  double get() {
    square = length * size;
    return square;
  }

  String getString(squ) {
    return '$length(comprimento) x $size(largura) = $square metros quadrados.';
  }

  bool isEmpty() {
    if (length == 0 || size == 0) {
      return true;
    } else {
      return false;
    }
  }
}

class CubicMeter {
  double length = 0.0;
  double size = 0.0;
  double heigth = 0.0;
  double cubic = 0.0;

  CubicMeter(this.heigth, this.length, this.size);

  double get() {
    cubic = length * size * heigth;
    return cubic;
  }

  String getString() {
    return '$length(comprimento) x $size(largura) x $heigth(altura) = ${get().toString()} metros quadrados.';
  }

  bool isEmpty() {
    if (length == 0 || size == 0 || heigth == 0) {
      return true;
    } else {
      return false;
    }
  }
}

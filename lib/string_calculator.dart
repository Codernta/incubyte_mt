class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String processedNumbers = numbers;

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      processedNumbers = parts[1];
    }

    processedNumbers =
        processedNumbers.replaceAll('\n', delimiter);

    final values = processedNumbers
        .split(delimiter)
        .map(int.parse)
        .toList();

    final negatives = values.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negatives.join(",")}',
      );
    }

    return values.reduce((a, b) => a + b);
  }
}
import 'package:flutter_test/flutter_test.dart';
import 'package:flower_shop/main.dart';

void main() {
  testWidgets('App renders main screen', (WidgetTester tester) async {
    await tester.pumpWidget(const FlowerShopApp());
    expect(find.text('Bloom & Petals'), findsWidgets);
  });
}

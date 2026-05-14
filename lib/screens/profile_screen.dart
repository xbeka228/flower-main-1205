import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _darkTheme = false;
  bool _notifications = true;

  void _navigateTo(BuildContext context, String title, Widget content) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(title),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1a1a2e),
            elevation: 0,
          ),
          backgroundColor: const Color(0xFFFAFAFA),
          body: content,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 8),

          // Avatar & user info
          Center(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE91E63),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      'Т',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Тима',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1a1a2e),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'tima@example.com',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => _showEditProfile(context),
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text('Редактировать'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFE91E63),
                    side: const BorderSide(color: Color(0xFFE91E63)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Loyalty card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE91E63), Color(0xFFFF6090)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '🌸 Bloom Club',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Gold',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.65,
                    backgroundColor: Colors.white.withValues(alpha: 0.3),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '650 / 1000 баллов до Platinum',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Orders section
          const _SectionTitle(title: 'Заказы'),
          _MenuItem(
            icon: Icons.receipt_long,
            label: 'Мои заказы',
            trailing: '3 активных',
            onTap: () => _navigateTo(context, 'Мои заказы', _buildOrdersPage()),
          ),
          _MenuItem(
            icon: Icons.location_on_outlined,
            label: 'Адреса доставки',
            trailing: '2',
            onTap: () => _navigateTo(context, 'Адреса доставки', _buildAddressesPage()),
          ),
          _MenuItem(
            icon: Icons.credit_card,
            label: 'Способы оплаты',
            trailing: 'Visa ****',
            onTap: () => _navigateTo(context, 'Способы оплаты', _buildPaymentPage()),
          ),

          const SizedBox(height: 16),

          // Settings section
          const _SectionTitle(title: 'Настройки'),
          _MenuItem(
            icon: Icons.notifications_outlined,
            label: 'Уведомления',
            hasSwitch: true,
            switchValue: _notifications,
            onTap: () => setState(() => _notifications = !_notifications),
          ),
          _MenuItem(
            icon: Icons.dark_mode_outlined,
            label: 'Тёмная тема',
            hasSwitch: true,
            switchValue: _darkTheme,
            onTap: () => setState(() => _darkTheme = !_darkTheme),
          ),
          _MenuItem(
            icon: Icons.language,
            label: 'Язык',
            trailing: 'Русский',
            onTap: () => _navigateTo(context, 'Язык', _buildLanguagePage()),
          ),

          const SizedBox(height: 16),

          // Info section
          const _SectionTitle(title: 'Информация'),
          _MenuItem(
            icon: Icons.help_outline,
            label: 'Помощь и FAQ',
            onTap: () => _navigateTo(context, 'Помощь и FAQ', _buildFaqPage()),
          ),
          _MenuItem(
            icon: Icons.mail_outline,
            label: 'Связаться с нами',
            onTap: () => _navigateTo(context, 'Связаться с нами', _buildContactPage()),
          ),
          _MenuItem(
            icon: Icons.star_outline,
            label: 'Оценить приложение',
            onTap: () => _showRateDialog(context),
          ),
          _MenuItem(
            icon: Icons.privacy_tip_outlined,
            label: 'Политика конфиденциальности',
            onTap: () => _navigateTo(context, 'Политика конфиденциальности', _buildPrivacyPage()),
          ),

          const SizedBox(height: 24),

          // Logout
          OutlinedButton.icon(
            onPressed: () => _showLogoutDialog(context),
            icon: const Icon(Icons.logout),
            label: const Text('Выйти'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Версия 1.0.0',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showEditProfile(BuildContext context) {
    final nameController = TextEditingController(text: 'Тима');
    final emailController = TextEditingController(text: 'tima@example.com');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          20, 24, 20,
          MediaQuery.of(ctx).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Редактировать профиль',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Имя',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Профиль обновлён'),
                      backgroundColor: const Color(0xFFE91E63),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE91E63),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Сохранить', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Выйти из аккаунта?'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Вы вышли из аккаунта'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
            child: const Text('Выйти', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showRateDialog(BuildContext context) {
    int selectedStars = 0;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Оцените приложение'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (i) => GestureDetector(
              onTap: () => setDialogState(() => selectedStars = i + 1),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  i < selectedStars ? Icons.star : Icons.star_border,
                  color: const Color(0xFFFFB800),
                  size: 36,
                ),
              ),
            )),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Спасибо за оценку!'),
                    backgroundColor: const Color(0xFFE91E63),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              child: const Text('Отправить'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersPage() {
    final orders = [
      _OrderData('Заказ #1042', 'Букет "Нежность"', 'Доставляется', const Color(0xFFFF9800), '12 990 ₸'),
      _OrderData('Заказ #1038', 'Розы красные 25 шт', 'В обработке', const Color(0xFF2196F3), '8 490 ₸'),
      _OrderData('Заказ #1035', 'Букет "Весна"', 'Доставляется', const Color(0xFFFF9800), '5 990 ₸'),
      _OrderData('Заказ #1020', 'Тюльпаны микс', 'Доставлен', const Color(0xFF4CAF50), '3 490 ₸'),
      _OrderData('Заказ #1015', 'Пионы белые', 'Доставлен', const Color(0xFF4CAF50), '6 990 ₸'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(order.id, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: order.statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(order.status, style: TextStyle(color: order.statusColor, fontSize: 12, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(order.name, style: const TextStyle(color: Color(0xFF555555))),
              const SizedBox(height: 4),
              Text(order.price, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFE91E63))),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddressesPage() {
    final addresses = [
      {'title': 'Дом', 'address': 'ул. Абая 150, кв. 42, Алматы', 'icon': Icons.home},
      {'title': 'Работа', 'address': 'пр. Назарбаева 77, офис 301, Алматы', 'icon': Icons.work},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...addresses.map((addr) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE91E63).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(addr['icon'] as IconData, color: const Color(0xFFE91E63)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addr['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(addr['address'] as String, style: const TextStyle(color: Color(0xFF555555), fontSize: 14)),
                  ],
                ),
              ),
              const Icon(Icons.edit_outlined, color: Colors.grey, size: 20),
            ],
          ),
        )),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Добавить адрес'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFE91E63),
            side: const BorderSide(color: Color(0xFFE91E63)),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentPage() {
    final cards = [
      {'type': 'Visa', 'last4': '4821', 'icon': Icons.credit_card},
      {'type': 'Mastercard', 'last4': '7653', 'icon': Icons.credit_card},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...cards.map((card) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF1a1a2e).withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(card['icon'] as IconData, color: const Color(0xFF1a1a2e)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(card['type'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text('**** **** **** ${card['last4']}', style: const TextStyle(color: Color(0xFF555555), fontSize: 14)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        )),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Добавить карту'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFE91E63),
            side: const BorderSide(color: Color(0xFFE91E63)),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguagePage() {
    final languages = ['Русский', 'Қазақша', 'English'];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: languages.map((lang) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          title: Text(lang),
          trailing: lang == 'Русский'
              ? const Icon(Icons.check_circle, color: Color(0xFFE91E63))
              : null,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onTap: () {},
        ),
      )).toList(),
    );
  }

  Widget _buildFaqPage() {
    final faqs = [
      {'q': 'Как оформить заказ?', 'a': 'Выберите букет, добавьте в корзину и нажмите "Оформить заказ". Укажите адрес и способ оплаты.'},
      {'q': 'Сколько стоит доставка?', 'a': 'Доставка по городу бесплатная при заказе от 5 000 ₸. В остальных случаях — 1 000 ₸.'},
      {'q': 'Можно ли вернуть букет?', 'a': 'Если букет не соответствует заказу или повреждён, свяжитесь с нами в течение 2 часов после доставки.'},
      {'q': 'Как отследить заказ?', 'a': 'В разделе "Мои заказы" отображается статус каждого заказа в реальном времени.'},
      {'q': 'Какие способы оплаты доступны?', 'a': 'Visa, Mastercard, Kaspi QR, наличные при доставке.'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        final faq = faqs[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            title: Text(faq['q']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [Text(faq['a']!, style: const TextStyle(color: Color(0xFF555555), height: 1.5))],
          ),
        );
      },
    );
  }

  Widget _buildContactPage() {
    final contacts = [
      {'icon': Icons.phone, 'title': 'Телефон', 'value': '+7 (777) 123-45-67'},
      {'icon': Icons.email, 'title': 'Email', 'value': 'support@bloompetals.kz'},
      {'icon': Icons.access_time, 'title': 'Режим работы', 'value': 'Пн-Вс: 08:00 - 22:00'},
      {'icon': Icons.location_on, 'title': 'Адрес', 'value': 'г. Алматы, ул. Абая 150'},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: contacts.map((c) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE91E63).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(c['icon'] as IconData, color: const Color(0xFFE91E63)),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c['title'] as String, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 4),
                Text(c['value'] as String, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ],
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildPrivacyPage() {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Политика конфиденциальности', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text('Последнее обновление: 1 мая 2026', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 16),
          Text(
            '1. Сбор информации\n\n'
            'Мы собираем информацию, которую вы предоставляете при создании аккаунта, оформлении заказа и использовании приложения: имя, email, номер телефона, адреса доставки.\n\n'
            '2. Использование информации\n\n'
            'Ваши данные используются для обработки заказов, доставки цветов, улучшения сервиса и отправки уведомлений о статусе заказа.\n\n'
            '3. Защита данных\n\n'
            'Мы используем современные методы шифрования для защиты ваших персональных данных. Данные банковских карт обрабатываются через сертифицированные платёжные системы.\n\n'
            '4. Передача данных\n\n'
            'Мы не передаём ваши данные третьим лицам, за исключением служб доставки для выполнения заказа.\n\n'
            '5. Ваши права\n\n'
            'Вы можете запросить удаление или изменение ваших персональных данных, обратившись в службу поддержки.',
            style: TextStyle(fontSize: 15, color: Color(0xFF555555), height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _OrderData {
  final String id;
  final String name;
  final String status;
  final Color statusColor;
  final String price;

  _OrderData(this.id, this.name, this.status, this.statusColor, this.price);
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1a1a2e),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailing;
  final bool hasSwitch;
  final bool switchValue;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    this.trailing,
    this.hasSwitch = false,
    this.switchValue = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: const Color(0xFF555555)),
        title: Text(
          label,
          style: const TextStyle(fontSize: 15, color: Color(0xFF1a1a2e)),
        ),
        trailing: hasSwitch
            ? Switch(
                value: switchValue,
                onChanged: (_) => onTap(),
                activeTrackColor: const Color(0xFFE91E63),
              )
            : trailing != null
                ? Text(
                    trailing!,
                    style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                  )
                : const Icon(Icons.chevron_right, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}

import '../models/flower.dart';

const List<FlowerCategory> categories = [
  FlowerCategory(id: 'roses', name: 'Розы', icon: '🌹', color: 0xFFE91E63),
  FlowerCategory(id: 'tulips', name: 'Тюльпаны', icon: '🌷', color: 0xFFFF9800),
  FlowerCategory(id: 'bouquets', name: 'Букеты', icon: '💐', color: 0xFF9C27B0),
  FlowerCategory(id: 'plants', name: 'Комнатные', icon: '🪴', color: 0xFF4CAF50),
  FlowerCategory(id: 'gifts', name: 'Подарки', icon: '🎁', color: 0xFF2196F3),
];

const List<Flower> flowers = [
  Flower(
    id: '1',
    name: 'Красные розы',
    price: 2990,
    image: 'https://images.unsplash.com/photo-1490750967868-88aa4f44baee?w=400',
    category: 'roses',
    description:
        'Классический букет из 11 красных роз премиум качества. Свежие цветы с длинным стеблем, идеально подходят для выражения любви и романтических чувств.',
    rating: 4.8,
    reviews: 124,
  ),
  Flower(
    id: '2',
    name: 'Розовые пионы',
    price: 3490,
    image: 'https://images.unsplash.com/photo-1562690868-60bbe7293e94?w=400',
    category: 'roses',
    description:
        'Нежный букет из 9 розовых пионовидных роз. Воздушные бутоны с тонким ароматом создают атмосферу весенней свежести и романтики.',
    rating: 4.9,
    reviews: 89,
  ),
  Flower(
    id: '3',
    name: 'Белые розы',
    price: 2790,
    image: 'https://images.unsplash.com/photo-1558652093-2781879024eb?w=400',
    category: 'roses',
    description:
        'Элегантный букет из 15 белых роз. Символ чистоты и нежности, идеален для свадеб, юбилеев и особых торжеств.',
    rating: 4.7,
    reviews: 67,
  ),
  Flower(
    id: '4',
    name: 'Жёлтые тюльпаны',
    price: 1790,
    image: 'https://images.unsplash.com/photo-1589994160839-163cd867cfe8?w=400',
    category: 'tulips',
    description:
        'Яркий весенний букет из 15 жёлтых тюльпанов. Солнечное настроение в каждом лепестке, идеальный подарок для поднятия настроения.',
    rating: 4.6,
    reviews: 156,
  ),
  Flower(
    id: '5',
    name: 'Белые тюльпаны',
    price: 1990,
    image: 'https://images.unsplash.com/photo-1524386416438-98b9b2d4b433?w=400',
    category: 'tulips',
    description:
        'Изящный букет из 11 белых тюльпанов. Нежные цветы символизируют весну и новые начинания.',
    rating: 4.5,
    reviews: 43,
  ),
  Flower(
    id: '6',
    name: 'Микс тюльпанов',
    price: 2290,
    image: 'https://images.unsplash.com/photo-1520763185298-1b434c919102?w=400',
    category: 'tulips',
    description:
        'Разноцветный букет из 19 тюльпанов разных оттенков. Яркая композиция для тех, кто любит разнообразие.',
    rating: 4.7,
    reviews: 98,
  ),
  Flower(
    id: '7',
    name: 'Букет невесты',
    price: 4990,
    image: 'https://images.unsplash.com/photo-1522057306606-8d84824f3112?w=400',
    category: 'bouquets',
    description:
        'Роскошный свадебный букет из белых роз, эустомы и зелени. Элегантная композиция для самого важного дня.',
    rating: 5.0,
    reviews: 34,
  ),
  Flower(
    id: '8',
    name: 'Полевой букет',
    price: 2490,
    image: 'https://images.unsplash.com/photo-1487530811176-3780de880c2d?w=400',
    category: 'bouquets',
    description:
        'Очаровательный букет из полевых цветов: ромашки, васильки и лаванда. Натуральная красота в каждом цветке.',
    rating: 4.4,
    reviews: 72,
  ),
  Flower(
    id: '9',
    name: 'Орхидея фаленопсис',
    price: 3990,
    image: 'https://images.unsplash.com/photo-1567748157439-651aca2ff064?w=400',
    category: 'plants',
    description:
        'Элегантная орхидея фаленопсис в декоративном кашпо. Цветёт до 3 месяцев, не требует сложного ухода.',
    rating: 4.8,
    reviews: 112,
  ),
  Flower(
    id: '10',
    name: 'Монстера',
    price: 2990,
    image: 'https://images.unsplash.com/photo-1614594975525-e45190c55d0b?w=400',
    category: 'plants',
    description:
        'Тропическая монстера в стильном горшке. Популярное комнатное растение с эффектными резными листьями.',
    rating: 4.6,
    reviews: 87,
  ),
  Flower(
    id: '11',
    name: 'Подарочный набор «Люкс»',
    price: 5990,
    image: 'https://images.unsplash.com/photo-1549488344-1f9b8d2bd1f3?w=400',
    category: 'gifts',
    description:
        'Премиальный набор: букет из 25 красных роз, бельгийский шоколад Godiva и открытка ручной работы.',
    rating: 4.9,
    reviews: 45,
  ),
  Flower(
    id: '12',
    name: 'Набор «Весенний»',
    price: 3990,
    image: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400',
    category: 'gifts',
    description:
        'Весенний подарочный набор: букет тюльпанов, ароматическая свеча и коробка макарон.',
    rating: 4.7,
    reviews: 63,
  ),
];

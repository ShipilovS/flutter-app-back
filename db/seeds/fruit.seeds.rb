fruits = [
    {
        name: 'Абрикос',
        size_gram: '100',
        kilocalories: '44',
        description: "описание к товару"
    },
    {
        name: 'Банан',
        size_gram: '100',
        kilocalories: '96',
        description: "описание к товару"
    },
    {
        name: 'Лимон',
        size_gram: '100',
        kilocalories: '3',
        description: "описание к товару"
    },
    {
        name: 'Грейпфрут',
        size_gram: '100',
        kilocalories: '35',
        description: "описание к товару"
    },
    {
        name: 'Яблоки',
        size_gram: '100',
        kilocalories: '44',
        description: "описание к товару"
    },
    {
        name: 'Абрикосовое пюре',
        size_gram: '100',
        kilocalories: '60',
        description: "описание к товару"
    },
    {
        name: 'Апельсин',
        size_gram: '100',
        kilocalories: '43',
        description: "описание к товару"
    },
    {
        name: 'Мандарин',
        size_gram: '100',
        kilocalories: '53',
        description: "описание к товару"
    },
    {
        name: 'Банан',
        size_gram: '100',
        kilocalories: '96',
        description: "описание к товару"
    },
    {
        name: 'Нектарин',
        size_gram: '100',
        kilocalories: '44',
        description: "описание к товару"
    },
    {
        name: 'Ананас',
        size_gram: '100',
        kilocalories: '51',
        description: "описание к товару"
    },
    {
        name: 'Груша',
        size_gram: '100',
        kilocalories: '47',
        description: "описание к товару"
    },
    {
        name: 'Слива',
        size_gram: '100',
        kilocalories: '46',
        description: "описание к товару"
    },
]


fruits.each do |obj|
  Fruit.find_or_create_by(obj)
end
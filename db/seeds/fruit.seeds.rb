fruits = [
    {
        name: 'Абрикос',
        size_gram: '100',
        kilocalories: '44',
    },
    {
        name: 'Банан',
        size_gram: '100',
        kilocalories: '96',
    },
]


fruits.each do |obj|
  Fruit.find_or_create_by(obj)
end
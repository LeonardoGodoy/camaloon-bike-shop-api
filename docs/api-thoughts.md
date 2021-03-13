# Application Programming Interface (API) Scratch

#### POST /category

```ruby
# body params
{
  name: 'Category X',
  properties: [
    { title: 'some_property', values: ['value_1', 'value_2'] },
    { title: 'some_other_property', values: ['foo', 'bar'] }
  ]
}
```

#### POST /category/:category_id/product

```ruby
# body params
{
  title: 'Product X',
  properties: [
    { title: 'some_property', values: ['value_1', 'value_2', 'value_3'] },
    { title: 'some_other_property', values: ['foo', 'bar'] }
  ]
}
```
- creates properties and product versions based on it

#### GET /product/:product_id/product_versions
```ruby
# query params
{
  search: {
    properties: [
      { property_name: 'some_property', property_value: 'value_1' }
    ]
  }
}
```

#### POST /product/:product_id/product_versions/:id/disable

#### POST /product/:product_id/product_versions/:id/enable

#### POST /order

```ruby
# body params
{
  product_id: 'product_1',
  product_version_id: 'product_version_1'.
  quantity: 1
}
```

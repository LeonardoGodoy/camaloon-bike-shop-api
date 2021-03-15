# Application Programming Interface (API)

This document represents the first thoughts about the API main endpoints. It does not mean the final version will keep all of these ideas.

To access the final structure you can download the [postman collection]().

## Endpoints
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

#### POST /product

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

- Option 1: Using the product version directly

```ruby
# body params
{
  product_id: 'product_1',
  product_version_id: 'product_version_1'.
  quantity: 1
}
```

- Option 2: Using properties and its values

```ruby
# body params
{
  product_id: 'product_1',
  quantity: 1,
  property_values: [
    { property_id: 'property_1', value: 'foo' },
    { property_id: 'property_2', value: 'bar' }
  ]
}
```

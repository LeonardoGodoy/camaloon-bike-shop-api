## Basic Entities

### Product

```ruby
    { id: 'product_1', title: 'Bicycle X' }
    { id: 'product_2', title: 'Bicycle Y' }
```

Order

```ruby
    belongs_to :customer
    has_many :order_items

    { id: 'order_1', customer_id: 'customer_1' }
```

OrderItem

```ruby
    belongs_to :order
    belongs_to :product
    has_many :property_values

    { id: 'order_item_1', order_id: 'order_1', product_id: 'product_1' }
    { id: 'order_item_2', order_id: 'order_1', product_id: 'product_2' }
```

PropertyValue

```ruby
    belongs_to :order_item
    belongs_to :product
    belongs_to :property

    { id: 'prop_value_1', order_item_id: 'order_item_1', property_id: 'prop_1', product_id: 'product_1', value: '19' }
    { id: 'prop_value_2', order_item_id: 'order_item_1', property_id: 'prop_2', product_id: 'product_1', value: 'black' }
    { id: 'prop_value_3', order_item_id: 'order_item_2', property_id: 'prop_3', product_id: 'product_2', value: 'blue' }
  ```


---
## Option 1 - Value as an jsonb field

### Property

```ruby
{ id: 'prop_1', title: 'wire', values: ['17', '19', '21'] }
{ id: 'prop_2', title: 'color', values: ['blue', 'green', 'black'] }
```

### PropertyDependency - PropertyRestriction

```ruby
{ id: 'prop_dependency_1', property_id: 'prop_2', type: :value, target_property_id: 'product_1', target_values: ['17'] }
{ id: 'prop_dependency_1', property_id: 'prop_2', type: :value, target_property_id: 'product_1', target_value: '17', restict_values: ['17', '12'] }
```

#### Benefits
  - Fewer joins to assemble the property options. Database performance and form rendering speed enhancement.
  - Ease to extend, for example: if a property in the feature has ranges of possible values would be simple to customize the value structure.

#### Desadvantages
- Updates in values have to be propagated to their dependencies.
  - I considered it not that bad due to the lower frequency of product updates compared to product orders.


---

## Option 2 - Value as an Object

### Product

```ruby
{ id: 'product_1', title: 'Bicycle X' }
{ id: 'product_2', title: 'Bicycle Y' }
```

### Property

```ruby
belongs_to :product
has_many :property_values

{ id: 'prop_1', title: 'wire' }
{ id: 'prop_2', title: 'color'}
```

### PropertyValues

```ruby
belongs_to :property

{ id: 'prop_value_1', property_id: 'prop_1', value: '17' }
{ id: 'prop_value_2', property_id: 'prop_1', value: '19' }
{ id: 'prop_value_3', property_id: 'prop_1', value: '21' }
{ id: 'prop_value_4', property_id: 'prop_2', value: 'blue' }
{ id: 'prop_value_5', property_id: 'prop_2', value: 'green' }
```

### PropertyDependency - Restriction

```ruby
has_many :values # <- target property values to be excluded

{ id: 'prop_dependency_1', property_id: 'prop_2', type: :value, target_property_id: 'prop_1' }
```

### PropertyDependencyPropertyValues
(join table between values and dependencies)

```ruby
{ property_dependency_id: 'prop_dependency_1', property_value_id: 'prop_value_1' }
{ property_dependency_id: 'prop_dependency_1', property_value_id: 'prop_value_2' }
```


### Benefits

### Desadvantages

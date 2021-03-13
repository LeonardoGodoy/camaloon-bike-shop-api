# Data Modeling thoughts

Plan and document the data modeling process while showing the main thoughts and concerns about it.
This version was considered the better choice and documents the commited plans before implementation.

## How to read this document

Bellow there are descriptions of entities, each one containing the following:
- Main associations represented in active record notation.
- The purpose of the structure (it's concept).
- Observertions about the context it was planned and details to keep in mind during the development.
- Some examples of data as a use simulation.
    - All the examples have their ids with the name of it's model and an increasing number. In practice they will be **uuid** hashes.


## Entities

### Product
The *Product* keeps a good the shop offers.
```ruby
belongs_to :category
has_many :properties

{ id: 'product_1', category_id: 'category_1', title: 'Montain Bycicle PRO 2.0' }
{ id: 'product_2', category_id: 'category_2', title: 'Speed Bycicle XPTO' }
```

### Category
The *Category* keeps **reusable properties**. These properties will be inherited from products within.

```ruby
has_many :products
has_many :properties

{ id: 'category_1', name: 'Montain Bycicles' }
{ id: 'category_2', name: 'Speed Bycicles' }
```
### Property
The *Property* keeps the **customizable chacateristics** of products.

- We might copy category properties during the product creation to keep history.

- We could add some matadata like value types to select a **validation strategy** in the future.

```ruby
belongs_to :product, optional: true
belongs_to :category, optional: true

# category properties
{ id: 'prop_1', category_id: 'category_1', product_id: nil, title: 'wire', values: ['17', '19', '21'] }
{ id: 'prop_2', category_id: 'category_1', product_id: nil, title: 'color', values: ['blue', 'green', 'black'] }
{ id: 'prop_3', category_id: 'category_2', product_id: nil, title: 'wire', values: ['17', '19', '21'] }
{ id: 'prop_4', category_id: 'category_2', product_id: nil, title: 'color', values: ['white', 'black'] }

# product properties
{ id: 'prop_5', category_id: nil, product_id: 'product_1', title: 'wire', values: ['17', '19', '21'] }
{ id: 'prop_6', category_id: nil, product_id: 'product_1', title: 'color', values: ['blue', 'green', 'black'] }
{ id: 'prop_7', category_id: nil, product_id: 'product_2', title: 'wire', values: ['17', '19', '21'] }
{ id: 'prop_8', category_id: nil, product_id: 'product_2', title: 'color', values: ['white', 'black'] }
```

### ProductVersion
The *ProductVersion* keeps each **combination of chacateristics** (the order target). Here we would associate images and sku details.

- We have the possibility to desable/enable specific combinations to make then unavailable.

```ruby
belongs_to :product
has_many :property_values, class_name: 'ProductVersionPropertyValue'

{ id: 'product_version_1', product_id: 'product_1', enabled: true }
{ id: 'product_version_2', product_id: 'product_1', enabled: true }
# the next one represents a combination  unavailable to clients.
{ id: 'product_version_3', product_id: 'product_1', enabled: false }

{ id: 'product_version_4', product_id: 'product_2', enabled: true }
{ id: 'product_version_5', product_id: 'product_2', enabled: true }
{ id: 'product_version_6', product_id: 'product_2', enabled: true }
```

### ProductVersionPropertyValue
The *ProductVersionPropertyValue* keeps track of a **specific product version chacateristic**.
- This table tends to have loads of recods. So we have to keep things as simples as it can be.
- To decrease the number of hits in this table during the form building we could add a jsonb field in the product_version and update it only when the product changes.

```ruby
belongs_to :product_version
belongs_to :property

# The Montain Bycicle PRO 2.0 first available combination.
{ id: 'pvpv_1', product_version_id: 'product_version_1', property_id: 'prop_5' value: '17' }
{ id: 'pvpv_2', product_version_id: 'product_version_1', property_id: 'prop_6' value: 'blue' }

# The Montain Bycicle PRO 2.0 second available combination.
{ id: 'pvpv_3', product_version_id: 'product_version_2', property_id: 'prop_5' value: '17' }
{ id: 'pvpv_4', product_version_id: 'product_version_2', property_id: 'prop_6' value: 'green' }
```

### Order
The *Order* keeps **customer's products order**.

```ruby
belongs_to :customer
has_many :order_items

# add usable dates as ordered_at...
{ id: 'order_1', customer_id: 'customer_1' }
```
### OrderItem
The *OrderItem* keeps **each product version** the order is composed of.

```ruby
belongs_to :order
belongs_to :product
belongs_to :product_version

{ id: 'order_item_1', order_id: 'order_1', product_id: 'product_1', product_version_id: 'product_version_1', quantity: 10 }
{ id: 'order_item_2', order_id: 'order_1', product_id: 'product_2', product_version_id: 'product_version_4', quantity: 5 }
```

### Customer
The *Customer* keeps **customers informations**.

```ruby
has_many :orders

{ id: 'customer_1', name: 'Leonardo Godoy' }
```

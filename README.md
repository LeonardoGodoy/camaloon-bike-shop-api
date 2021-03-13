# Camaloon Bike Shop

This project was built as a technical test for a fullsatack position at Camaloon.
#### Requirements elicitation process
  - Extract requirements from the first description.
  - Design a low fidelity prototype to validate possible features with the stakeholder.
  - Propose data models for the solutions.
  - Indentify API needs from interface design.
  - Implement endpoints and its busness logic.
  - Start working on the frontend.

#### Identified Requirements
##### for admins

- Product/Properties management
  (TODO: Describe product and properties requirements )
##### for customers

- Habilty to order goods.
#### Low fidelity prototype

Due to the nature of this project, I designed the main views in a peace of paper. In a normal situation I would use a tool like [miro](https://miro.com/) to do it.
### Data modeling documentation

To check all the datails about the hole process you can read the 
[data modeling introduction](https://github.com/LeonardoGodoy/camaloon-bike-shop-api/blob/master/docs/data_modeling_introduction.md). There I described my entire approach and some datails about how I progressed. If you want the visual final version, you can access the [Entity Relationship Diagram (ERD)]() as well.

#### API endpoints

Matching the main views/features I started to model the [API endpoints](https://github.com/LeonardoGodoy/camaloon-bike-shop-api/blob/master/docs/api_introduction.md.md) we would need. I considered using GraphQL but decided to make a resfull API due to time constraints.

### Setup instructons
* Database creation

```bash
bundle exec rails db:create db:migrate db:seed
```

* How to run the test suite

```bash
bundle exec rspec spec
```

* Deployment instructions
  - TODO


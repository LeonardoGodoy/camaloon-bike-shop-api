# Camaloon Bike Shop

This project was built as a technical test for a fullsatack position at Camaloon.

You can check the [system description](https://drive.google.com/file/d/1scSCrF8YyS4eB90vtcV8Yp-QFiSAlcxJ/view?usp=sharing) provided.

#### Requirements elicitation process
  - Extract requirements from the first description.
  - Design a low-fidelity prototype to validate possible features with the stakeholder.
  - Propose data models for the solutions.
  - Identify API needs from interface design.
  - Implement endpoints and their business logic.
  - Start working on the frontend.

#### Identified Requirements

(TODO: Describe requirements)
##### for admins

- Product/Properties management
##### for customers

-  Habilty to order goods.
### Low fidelity prototype

Due to the nature of this project, I designed the main views on a piece of paper. In a normal situation, I would use a tool like [miro](https://miro.com/) to do it.
### Data modeling documentation

To check all the details about the whole process you can read the
[data modeling introduction](https://github.com/LeonardoGodoy/camaloon-bike-shop-api/blob/master/docs/data_modeling_introduction.md). There I described my entire approach and some details about how I progressed. If you want the visual final version, you can access the [Entity Relationship Diagram (ERD)](https://drive.google.com/file/d/1Ynt7Fmqa2OI5d8wAatmc9OWEFLTkme13/view?usp=sharing) as well.

### API endpoints

Matching the main views/features, I started to model the [API endpoints](https://github.com/LeonardoGodoy/camaloon-bike-shop-api/blob/master/docs/api_introduction.md) we would need. I considered using GraphQL but decided to make a restful API due to time constraints.

To access the final structure you can download the [postman collection](https://drive.google.com/file/d/1p18LVHrn3GBpm0hzsjS3zSsS7fXqJz1U/view?usp=sharing).

### TODO list

- Validation handling on creation
  - categories
  - products
  - orders

- Order parser refactorying (WIP)
- Product combination serialization refactorying
- Organize services namespaces

### Setup instructons
* Database creation

```bash
bundle exec rails db:create db:migrate db:seed
```

* How to run the test suite

```bash
bundle exec rspec spec
```

* How to run static code analyzer (linter)
```bash
rubocop
```

* Deployment instructions

This project is not hosted so far.


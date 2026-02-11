# Models Description

 This file contains models for the Foodie project.
 Model names are sub-titles, properties are in bullet points listed under the model name.
 Properties follow the order : `name, type, nullable, relationship details`. If `nullable` is not given assume that property is nullable.

 Once the models are created generate migration files for them and run the migration. Generate a seed file and populate the tables with appropriate seed data for the models.

## User

- name, String
- role, Integer
- email_address, String
- orders, List of Order, User can have many Order

## Order

- company, Company, Order has one Company
- items, List of Item, Order has many Item
- delivery_date, Date
- deadline_date, Date

## Company

- name, String
- website, String

## Menu

- items, List of Item, Menu has many Item
- company, Company, Menu belongs to Company

## Item

- name, String
- description, String
- price, Money

## Email

- title, String
- body, String
- company, Company, Email has one Company
- recipients, List of String
- menu_link, String

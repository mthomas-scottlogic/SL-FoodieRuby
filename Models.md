# Models Description
 This file contains models for the Foodie project.
 Model names are sub-titles, properties are in a bullet points listed under the model name.
 Properties follow the order property name then property type, e.g: <name>, <type>

## User
- name, String 
- role, Integer
- email_address, String
- orders, List of Order

## Order
- company, Company
- items, List of Item
- delivery_date, Date
- deadline_date, Date

## Company
- name, String
- website, String

## Menu
- items, List of Item
- company, Company

## Item
- name, String
- description, String
- price, Money

## Email
- title, String
- body, String
- company, Company
- recepients, List of String
- menu_link, String

# TRNDVISION - E-Commerce Relational Database Architecture

A fully normalized relational database architecture designed for an e-commerce platform using Oracle Database.

## Architecture Highlights
* **Normalized Relational Model:** Normalized up to the Third Normal Form (3NF) to eliminate data redundancy and preserve referential integrity.
* **Complex Data Schemas:** Structured to handle core e-commerce domains: customers, product catalog, orders, inventory, and payment transactions.
* **Integrity & Constraints:** Strict primary/foreign key validations, check constraints, unique indexes, and sequence triggers tailored for Oracle SQL.

## Tech Stack
* Oracle Database / Oracle SQL
* Entity-Relationship Modeling (ERD)
* Oracle SQL Developer / DBeaver

## Repository Structure
* `/scripts`:
  * `schema.sql`: Complete DDL/DML scripts containing table structures, constraints, sequences, and seed data.

## How to Set Up
1. Connect to your Oracle instance via Oracle SQL Developer, SQL*Plus, or DBeaver.
2. Execute `scripts/schema.sql` to generate all tables, relationships, constraints, and initial data.

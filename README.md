# Home-Garden-Database 

## Description  
This project is a structured database designed to help manage a home garden efficiently. It keeps track of plants, seeds, planting history, sections, and germination progress. The goal is to provide an organized way to document and monitor plant growth, ideal conditions, and garden activities over time.  

The database is built using **SQLite** and includes multiple tables with relationships to store detailed information about the garden.  

## 📂 Project Files  

### `schema.sql`  
Defines the database structure, including tables for plants, seeds, sections, and germination tracking. It also includes constraints to maintain data integrity.  

### `queries.sql`  
Contains SQL queries for managing and retrieving data from the database. These include inserting new plants, updating planting records, and generating useful reports.  

### `DESIGN.md`  
A document explaining the purpose, scope, and structure of the database, along with an entity-relationship diagram.  

## 🌿 How It Works  
1. Users insert plant details, including type, sunlight, water requirements, and soil preferences.  
2. The system keeps track of where and when plants are added to the garden.  
3. Users can query the database to check plant care schedules, track growth progress, and optimize planting decisions.  

## 🚀 How to Use  
- Ensure you have SQLite installed.  
- Run `sqlite3 database.db < schema.sql` to create the database structure.  
- Use `sqlite3 database.db < queries.sql` to insert or retrieve information from the database.  

## 🔮 Future Improvements  
- Implementing an interface for easier data entry.  
- Adding automation for reminders (e.g., when to water or fertilize plants).  
- Integration with external weather APIs to suggest optimal planting times.  

This project aims to make home gardening more data-driven, helping gardeners make informed decisions for a healthier and more productive garden. 🌱  

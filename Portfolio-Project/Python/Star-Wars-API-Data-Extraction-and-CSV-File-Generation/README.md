
# Star-Wars-API-Data-Extraction-and-CSV-File-Generation

Project File [_click Google Colab_](https://colab.research.google.com/drive/1-lYRVPBI9gwD74Nyxpy6SKT1fF-JVdTb?usp=sharing)

This project come from practice made by Data Rockie School.

website https://data-science-bootcamp1.teachable.com/

Thanks for the practice.

## Objective:
- The primary goal of this project is to extract specific data points from the Star Wars API (SWAPI) for the first five characters and save this data into a CSV file. This involves retrieving detailed information on character attributes and their respective homeworlds.

## Key Objectives:
- To retrieve and compile data on characters from the Star Wars universe using the SWAPI.
- To process and extract specific attributes: name, height, mass, gender, and homeworld.
- To store the extracted data in a structured format within a CSV file for further analysis or reporting.

## Features:
### API Request and Data Extraction:
- Purpose: To fetch data from SWAPI endpoints and extract relevant character information.
Columns Extracted: name, height, mass, gender, homeworld.
- Methodology: Iterative API calls to gather data for characters with IDs from 1 to 5.

### Data Processing:
- Homeworld Extraction: Additional API call to fetch and extract the name of the homeworld for each character.
- Data Structuring: Collected data is organized into a dictionary format for each character.

### Data Storage:
- Purpose: To save the processed data in a CSV file.
- Output: A CSV file named 5_star_wars_people.csv containing the extracted character information.

## Components:
### API Interaction:
- Initial Test: Verification of API accessibility and response handling.
- Loop for Data Collection: A loop to automate API requests for the first five character IDs.

### Data Extraction:
- JSON Parsing: Extraction of required fields from the JSON response.
- Homeworld Data Fetch: Additional API request to retrieve homeworld information based on the URL provided in the character data.

### Data Storage and Output:
- DataFrame Construction: Utilizing Pandas to structure the collected data.
- CSV Generation: Writing the structured data into a CSV file for easy access and analysis.

## Detailed Steps:
### Initial Setup:
- Import necessary modules: requests for API calls and pandas for data manipulation.
- Define the base URL for SWAPI requests.

### API Request Loop:
- Iterate over character IDs from 1 to 5.
- For each ID, request data from the SWAPI endpoint.
- Extract name, height, mass, gender, and homeworld URL from the response.
- Make a secondary request to fetch the homeworld name.

### Data Compilation:
- Store extracted data in a dictionary.
- Append each character's dictionary to a list.

### Data Output:
- Convert the list of dictionaries into a Pandas DataFrame.
- Write the DataFrame to a CSV file named 5_star_wars_people.csv.

## Project Outcome:
- The project successfully automates the extraction and storage of character data from the Star Wars API. The resulting CSV file serves as a structured dataset that can be used for further analysis or reporting, providing insights into key attributes of selected Star Wars characters and their homeworlds. This approach can be extended to include additional characters or attributes as needed.

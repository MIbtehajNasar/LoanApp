# Loan Calculator

## Overview

This Ruby on Rails application calculates estimated profits for loans based on user input. It includes form submission, loan calculations, PDF generation, and email integration.

## Features

- **Form Creation**: Collects loan details from users.
- **Logic Implementation**: Calculates loan amount, interest expense, and estimated profit based on input constraints.
- **PDF Generation**: Creates a termsheet PDF with loan details and Longleaf Lending's terms.
- **Email Integration**: Automatically emails the generated PDF to the user upon form submission.

## Form Fields

The form collects the following details:
- Address
- Loan term (in months)
- Purchase price
- Repair budget
- After repair value (ARV)
- Name
- Email
- Phone

## Calculation Logic

The application calculates the estimated profit based on the following constraints and formulas:

1. **Loan Amount Calculation**:
    - Maximum Loan Amount by Purchase Price: 90% of Purchase Price
    - 100% of the repair budget can be funded
    - Maximum Loan Amount by ARV: 70% of ARV
    - Loan Amount = min(Max Loan Amount by Purchase Price + Repair Budget, Max Loan Amount by ARV)
2. **Interest Expense Calculation**:
    - Monthly Interest Rate = 13% / 12
    - Total Interest Expense = Monthly Interest Rate × Loan Amount × Loan Term
3. **Estimated Profit**:
    - Profit = ARV - Loan Amount - Interest Expense

## PDF Generation

The application generates a termsheet PDF that includes:
- User-provided input details
- Calculated loan amount
- Estimated profit

## Email Integration

Upon form submission, the application automatically emails the generated PDF to the user. The `letter_opener` gem is used during development to preview emails in the browser.

## Tech Stack

- **Backend**: Ruby on Rails
- **Styling**: Tailwind CSS
- **PDF Generation**: Wicked PDF
- **Background Jobs**: Sidekiq
- **Email Preview**: letter_opener gem

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/MIbtehajNasar/LoanApp.git
    ```
2. Navigate to the project directory:
    ```sh
    cd LoanApp
    ```
3. Install dependencies:
    ```sh
    bundle install
    yarn install
    ```
4. Create and migrate the database:
   ```sh 
   rails db:create && rails db:migrate 
   ```
5. Start the Rails server:
    ```sh
    ./bin/dev
    ```

## Usage
- Open your web browser and navigate to http://localhost:3000.
- Fill out the loan form with the necessary details and submit.
- The application will calculate the loan amount, interest expense, and estimated profit.
- A termsheet PDF will be generated and emailed to the provided email address.

## Development
To preview emails in the browser, use the letter_opener gem, which opens emails in your default web browser instead of sending them, making it easier to test email content during development.
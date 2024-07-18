## Customer Table
This table stores information about customers.

| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| customer_id       | INT          | Primary Key, Auto-increment                      |
| name              | VARCHAR(50)  | name of customer                                 |
| email             | VARCHAR(100) | Unique email address                             |
| password_hash     | VARCHAR(255) | Hashed password                                  |
| custmer_since     | TIMESTAMP    | Record creation timestamp                        |

## Address Table
This table stores address information for machines.

| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| address_id        | INT          | Primary Key, Auto-increment                      |
| address           | VARCHAR(255) | Street address                                   |
| city              | VARCHAR(100) | City                                             |
| state             | VARCHAR(100) | State                                            |
| postal_code       | VARCHAR(20)  | Postal code                                      |
| country           | VARCHAR(100) | Country                                          |
| latitude          | DECIMAL(9,6) | Latitude                                         |
| longitude         | DECIMAL(9,6) | Longitude                                        |
| created_at        | TIMESTAMP    | Record creation timestamp                        |

## Snack Table
This table is for snacks. It keeps track of diffrent snacks and how many times a snack has been 
sold.

| Column Name       | Data Type     | Description                                      |
|-------------------|---------------|--------------------------------------------------|
| snack_id          | INT           | Primary Key, Auto-increment                      |
| cost              | DECIMAL(10,2) | Payment amount                                   |
| name              | VARCHAR(50)   | Name of snack                                    |
| brand             | VARCHAR(50)   | Brand of snack                                   |
| country           | VARCHAR(50)   | country of snack                                 |
| sold_count        | INT           | keeps track of how many have been sold           |

## Machine
This table stores the machine information. It keeps track of the number of snacks in the 
machine slots and location data of the machine.
| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| machine_id        | INT          | Primary Key, Auto-increment                      |
| name              | VARCHAR(50)  | Name of machine                                  |
| address_id        | INT          | Foreign Key, references Address                  |


## Machine_Slot Table
| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| slot_id           | INT          | Primary Key, Auto-increment                      |
| Machine_id        | INT          | Foreign Key, references Cart                     |
| Snack_id          | INT          | Foreign Key, references Snack                    |
| Slot_count        | INT          | The number of snacks in the slot                 |



## Cart Table
Stores The cart and custome that tha cart belongs to 

| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| Cart_id           | INT          | Primary Key, Auto-increment                      |
| customer_id       | INT          | Foreign Key, references Customer                 |

## Cart_item Table
Stores snack infomation so multiple snacks can be in a single cart

| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| Cart_item_id      | INT          | Primary Key, Auto-increment                      |
| Machine_id        | INT          | Foreign Key, references Machine                  |
| Machine_id        | INT          | Foreign Key, references Cart                     |
| Snack_id          | INT          | Foreign Key, references Snack                    |
| Quantity          | INT          | The amount of this particular snack              |




## Transaction Table
This table stores transaction information.
| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| transaction_id    | INT          | Primary Key, Auto-increment                      |
| customer_id       | INT          | Foreign Key, references Customer                 |
| address_id        | INT          | Foreign Key, references Address                  |
| date              | DATETIME     | Event date and time                              |
| cart_id           | INT          | Foreign Key, references Cart                     |
| machine_id        | INT          | Foreign Key, references Machine                  |




## Manger_Time Table
This table stores the clock in and clock out time of the managers
| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| Manger_Time_id    | INT          | Primary Key, Auto-increment                      |
| Manager_id        | INT          | Foreign Key, references Manager                  |
| Time_in           | DATETIME     | Time of clock in                                 |
| Time_out          | DATETIME     | Time of clock out                                |

## Manager Table
Stores The names of machine mangers
| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| Manager_id        | INT          | Primary Key, Auto-increment                      |
| name              | VARCHAR(50)  | Name of manager                                  |

## Manager_machine Table
This ajunction table for machines and managers. A manager can have many machines assigend to them. 
A machine can also have may mangers.

| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| manager_machine_id| INT          | Primary Key, Auto-increment                      |
| Manager_id        | INT          | Foreign Key, references Manager                  |
| Machine_id        | INT          | Foreign Key, references Machine                  |

## Expenses Table
Stores business expenses

| Column Name       | Data Type     | Description                                      |
|-------------------|---------------|--------------------------------------------------|
| expense_id        | INT           | Primary Key, Auto-increment                      |
| expense_name      | VARCHAR(50)   | Name of expense                                  |
| expense_reason    | ENUM          | Expense type (Repair, stock, pay, other)         |
| amount            | DECIMAL(10,2) | Payment amount                                   |

## Payment_vault Table
Stores the payment methods of customers 

| Column Name       | Data Type    | Description                                          |
|-------------------|--------------|------------------------------------------------------|
| payment_id        | INT          | Primary Key, Auto-increment                          |
| customer_id       | INT          | Foreign Key, references Customer                     |
| card_type         | ENUM         | Payment_vault type (Visa, AMEX, Discover, MasterCard)|
| card_number       | BIGINT       | Number on the card                                   |
| security_code     | INT          |  3 or 4 digits on the back of the card               |
| name              | VARCHAR(100) | Name as it appears on the card                       |
| experation_date   | VARCHAR(7)   | expiration date of the card MM/YYYY                  |

## Snack_Request Table
Stores requests made by customers. The requests are requests for sancks that customer would like to be stocked in the machine.

| Column Name       | Data Type    | Description                                      |
|-------------------|--------------|--------------------------------------------------|
| Request_id        | INT          | Primary Key, Auto-increment                      |
| Machine_id        | INT          | Foreign Key, references Machine                  |
| snack_name        | VARCHAR(50)  | Name of the desired snack                        |
| brand             | VARCHAR(50)  | The brand name of the snack                      |
| date              | DATETIME     | Date of the request                              |




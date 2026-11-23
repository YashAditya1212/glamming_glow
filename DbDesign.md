<img width="1822" height="685" alt="image" src="https://github.com/user-attachments/assets/c82828ce-c4ae-4597-bd37-95dc27945df6" />

This is my initial Db design i will be using PostgreSQL for it as RDS is similar. 
The id are the primary key in the tables. 
Right now i will not mark the inside info of things like 1 user_id can have opted for multiple services and multiple bookings but will have a payment table entry for each booking_id. 
User_id, Beautician_id, customer_id, address_id , booking_id are the foreign keys pointing to the other tables. 
